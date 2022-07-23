package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
)

func main() {
	port := 80

	http.HandleFunc("/", indexHandler)
	log.Printf("Starting server on port %v\n", port)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%v", port), nil))
}

func indexHandler(w http.ResponseWriter, req *http.Request) {
	io.WriteString(w, "<h1>Hello World</h1>")
}
