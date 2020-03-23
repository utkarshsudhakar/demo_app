# Start from the latest golang base image
FROM golang:latest

# Add Maintainer Info

LABEL maintainer="Utkarsh Sudhakar <sudhakar.utkarsh9@gmail.com>"

# Set the Current Working Directory inside the container

WORKDIR $GOPATH/src/github.com/utkarshsudhakar/demo_app/

# Copy the source from the current directory to the Working Directory inside the container

COPY . .

# Get all the dependencies
RUN go get -d -v ./...

#Install all the dependencies
RUN go install -v ./...

#build the app
RUN go build -o demo_app .

# Expose port 4047 to the outside environment
EXPOSE 4047

#cmd to run app

CMD ["./demo_app"]


