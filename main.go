package main

import (
	"net/http"

	"github.com/pkg/profile"
	"github.com/utkarshsudhakar/demo_app/apmservice"
)

func main() {

	defer profile.Start().Stop()
	apmservice.Init()
	http.ListenAndServe(":4047", nil)
}
