## Paths

Prometheus read - `/`
Prometheus write - `/api/v1/write` and also requires the `--web.enable-remote-write-receiver` flag on Prometheus

Loki read - `/`
Loki write - `/loki/api/v1/push`

Cortex read - `/api/prom`
Cortex write - `/api/v1/push`

# TODO
1. Attach labels to HotROD spans using Grafana Agent
1. Use custom YAML for Grafana too. Little more complicated but it shouldn't be..

## Image Rendering
Image Rendering is actually a Grafana OSS feature. You can capture images of panels when panel alerts go off, and send that image with the alert.

PDF Exporting and Reporting are the Grafana Enterprise features.

If you install the plugin, you don't need to set `rendering.server_url` or `rendering.callback_url`. The plugin is part of the Grafana process and is reached on the same port as Grafana.

If you are using the container, which you should definitley do, then be aware that `grafana/grafana-image-renderer` listens on 8081 and `bitnami/grana-image-renderer` listens on 8080.

If you use the plugin, you do need to set `rendering.server_url` and `rendering.callback_url` as per the docs.


## Example app
HotROD is the example app used in this repo

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

