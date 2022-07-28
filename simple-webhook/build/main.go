package main

import (
    "log"
    "net/http"
    "io/ioutil"
    "io"
)

var webhook_body = "Hello World"

func webhook(w http.ResponseWriter, req *http.Request) {

    if req.Method == "POST" {
        b, err := ioutil.ReadAll(req.Body)
        if err != nil {
            log.Printf("Failed to parse webhook")
        }
        webhook_body = string(b)
    } else if req.Method == "GET" {
        log.Printf(string(webhook_body))
        io.WriteString(w, webhook_body)

    }
}

func main() {

    http.HandleFunc("/webhook", webhook)
    http.ListenAndServe(":8090", nil)
}