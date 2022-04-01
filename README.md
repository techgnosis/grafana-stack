## Paths

Mimir read - `/prometheus`

Mimir write - `/api/v1/push`

Loki read - `/`

Loki write - `/loki/api/v1/push`


# TODO
1. Figure out histogram query
1. Make an alert on the histogram


## Image Rendering
Image Rendering is actually a Grafana OSS feature. You can capture images of panels when panel alerts go off, and send that image with the alert.

PDF Exporting and Reporting are the Grafana Enterprise features.

If you install the plugin, you don't need to set `rendering.server_url` or `rendering.callback_url`. The plugin is part of the Grafana process and is reached on the same port as Grafana.

If you are using the container, which you should definitley do, then be aware that `grafana/grafana-image-renderer` listens on 8081 and `bitnami/grana-image-renderer` listens on 8080.

If you use the plugin, you do need to set `rendering.server_url` and `rendering.callback_url` as per the docs.


## Importing dashboards
Whether you use the "Import" button or you use the API directly via curl or Terraform, you need to change the datasource UIDs in the JSON. Otherwise the panels will be broken.


## Example app
HotROD is the example app used in this repo

## Keycloak
Realm (You MUST make a new Realm. You CAN NOT use Master, it does not work):
1. Make a new Realm called `grafana`
1. In the realm settings click `OpenID Endpoint Configuration` and record the URL for `authorization_endpoint`, `token_endpoint`, and `userinfo_endpoint` for use in `grafana.ini`

Client:
1. Click on `clients`, then `Create`
1. Enter `grafana` as the Client ID
1. Make sure the protocol is `openid-connect`
1. Change `Access type` to `confidential`
1. Change `Valid Redirect URIs` to `https://grafana.lab.home/login/generic_oauth`

Users:
1. Go to Federation
1. Select LDAP
1. Import Users = On
1. Edit Mode = READ_ONLY
1. Vendor = Other
1. Username LDAP attribute = cn
1. RDN LDAP attribute = cn
1. UUID LDAP attribute = entryUUID
1. User Object Classes = inetOrgPerson, organizationalPerson
1. Connection Url = ldap://openldap.openldap.svc.cluster.local
1. Users DN = dc=example,dc=org
1. Search Scope = One Level
1. Bind type = simple
1. Bind DN = cn=admin,dc=example,dc=org
1. Bind credential = admin

