Use this repo to install Grafana, GEM, GEL, Tempo, Grafana Agent, and a fully instrumented demo app called `tns`


## Setup
The following steps need to be done by hand:
1. Setup and enable GEM plugin
1. Setup and enable GEL plugin
1. GEM Instance, Access Policy, and Token creation
1. GEL Instance, Access Policy, and Token creation


## TODO


## TNS
* TNS sends spans via Jaeger Thrift HTTP on port 14268
* sock-shop sends spans via Zipkin on port 9411
* the Grafana Agent can only send to Tempo via OTLP on port 4317

## Keycloak
Realm:
1. Make a new Realm called `grafana`
1. In the realm settings click `OpenID Endpoint Configuration` and record the URL for `authorization_endpoint`, `token_endpoint`, and `userinfo_endpoint` for use in `grafana.ini`

Client:
1. Click on `clients`, then `Create`
1. Enter `grafana` as the Client ID
1. Make sure the protocol is `openid-connect`
1. Change `Access type` to `confidential`
1. Change `Valid Redirect URIs` to `https://grafana.lab.home/login/generic_oauth`

