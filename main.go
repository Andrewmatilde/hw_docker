package main

import (
	"log"
	"net/http"
)

type helloHandler struct{}

func (h *helloHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	_, _ = w.Write([]byte("Hello, world!"))
}

func main() {
	http.Handle("/", &helloHandler{})
	log.Fatal(http.ListenAndServe(":8080", nil))
}
