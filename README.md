This repo does not represent a finished project and is purely for my own learning purposes

This repo is for deploying the entire Grafana Labs Enterprise suite:
* Grafana Enterprise
* Grafana Enterprise Metrics
* Grafana Enterprise Logs
* Grafana Enterprise Traces

## TODO
* Fix `gem-single-process`. The Ring Health does not work well in the plugin
* Fix `gel-simple-scale`. Neither read nor write work.
* Fix `grafana`. 

## Setup
The following steps need to be done by hand:
1. Setup and enable GEM plugin
1. Setup and enable GEL plugin
1. Setup and enable GET plugin
1. GEM Tenant, Access Policy, and Token creation
1. GEL Tenant, Access Policy, and Token creation
1. GET Tenant, Access Policy, and Token creation


## Paths

Loki read - `/`
Loki write - `/loki/api/v1/push`

Cortex read - `/api/prom`
Cortex write - `/api/v1/push`



## Image Rendering
Image Rendering is actually a Grafana OSS feature. You can capture images of panels when panel alerts go off, and send that image with the alert.

PDF Exporting and Reporting are the Grafana Enterprise features.

If you install the plugin, you don't need to set `rendering.server_url` or `rendering.callback_url`. The plugin is part of the Grafana process and is reached on the same port as Grafana.

If you are using the container, which you should definitley do, then be aware that `grafana/grafana-image-renderer` listens on 8081 and `bitnami/grana-image-renderer` listens on 8080.

If you use the plugin, you do need to set `rendering.server_url` and `rendering.callback_url` as per the docs.


## Example app
Grafana itself is instrumented with Prometheus metrics and Jeager traces, and it logs trace IDs in its logs. It's the perfect example app.

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

