Use this repo to install Grafana, Prometheus, Loki, Tempo, Grafana Agent, and a demo app called `tns` that logs, serves Prometheus metrics, and emits Jaeger spans

Notes:  
* TNS sends spans via Jaeger Thrift HTTP (port 14268)

The following items need to be done manually:
1. Applying the Grafana Enterprise license to Grafana Enterprise
1. Setting up the GEM data source
1. Setting up the GEL data source


The following items are in this repo but do not work yet:
1. Grafana Agent for pushing spans to Tempo


TODO:
1. Replace Loki with GEL
1. Script out using grafana-cli to download GEM and GEL plugins