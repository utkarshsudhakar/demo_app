package main

import (
	"net/http"

	"github.com/utkarshsudhakar/demo_app/apmservice"
)

func main() {

	apmservice.Init()
	http.ListenAndServe(":4047", nil)
}
