Use this repo to install Grafana, Prometheus, Loki, Tempo, Grafana Agent, and a fully instrumented demo app called `tns`


## Setup
The following items need to be done manually:
1. Setting up the GEM data source

## TODO
1. Replace Loki with GEL

## TNS
* TNS sends spans via Jaeger Thrift HTTP on port 14268
* sock-shop sends spans via Zipkin on port 9411
* the Grafana Agent can only send to Tempo via OTLP on port 4317

## Grafana Enterprise
Run these commands from the Grafana Enterprise container to install the GEM and GEL plugins:  
grafana-cli plugins install grafana-metrics-enterprise-app  
grafana-cli plugins install grafana-enterprise-logs-app

## GEM
1. `install.sh`
1. Inside the Grafana Enterprise container, run `grafana-cli plugins install grafana-metrics-enterprise-app`
1. Restart Grafana Enterprise
1. Pull the token out of the `tokengen` job in K8s
1. In the Grafana Plugins section:
    1. enable the GEM plugin
    1. add the token from the `tokengen` job from earlier
    1. Add the GEM endpoint, which is `gem-enterprise-metrics-gateway:8080`
1. In the GEM plugin itself, create an Instance for your app or team or whatever
1. In the GEM plugin itself, create an Access Policy
1. After the policy is made, create a token
    1. Click the button to automatically create a data source
    1. Put the connection info into `.envrc`
    1. Run `agent/install.sh` and restart the Pod if needed

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

