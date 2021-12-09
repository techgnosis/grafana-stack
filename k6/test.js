import http from "k6/http";

export default function() {
    let response = http.get("https://grafana.lab.home");
};