package main

import (
    "log"
    "net/http"
    "io/ioutil"
)

func webhook(w http.ResponseWriter, req *http.Request) {

    b, err := ioutil.ReadAll(req.Body)
    if err != nil {
        log.Printf("Failed to parse webhook")
    }
    log.Printf(string(b))
}

func main() {

    http.HandleFunc("/webhook", webhook)
    http.ListenAndServe(":8090", nil)
}