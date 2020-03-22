# Start from the latest golang base image
FROM golang:latest

# Add Maintainer Info
LABEL maintainer="Utkarsh Sudhakar <sudhakar.utkarsh9@gmail.com>"

RUN git clone https://github.com/utkarshsudhakar/demo_app.git /demo_app
# Set the Current Working Directory inside the container
WORKDIR /demo_app

# Copy go mod and sum files
#COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app
RUN go build -o main .

# Expose port 8080 to the outside world
EXPOSE 4047

# Command to run the executable
CMD ["./main"]