package main

import (
    "log"
    "net/http"
)

func webhook(w http.ResponseWriter, req *http.Request) {

    log.Printf("Webhook activated\n")
}

func main() {

    http.HandleFunc("/webhook", webhook)
    http.ListenAndServe(":8090", nil)
}