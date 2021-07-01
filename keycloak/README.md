Realm:
1. Make a new Realm called `grafana`
1. In the realm settings click `OpenID Endpoint Configuration` and record the URL for `authorization_endpoint`, `token_endpoint`, and `userinfo_endpoint`

Client:
1. Click on `clients`, then `Create`
1. Enter `grafana` as the Client ID
1. Make sure the protocol is `openid-connect`
