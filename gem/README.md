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
