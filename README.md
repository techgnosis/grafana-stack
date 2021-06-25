Use this repo to install Grafana, Prometheus, Loki, Tempo, Grafana Agent, and a demo app called `tns` that logs, serves Prometheus metrics, and emits Jaeger spans

TNS sends spans via Jaeger Thrift Compact on port 6831

Bugs:  
1.  
```
receivers:
            jaeger:
              protocols:
                thrift_compact: null
```  
creates a TCP service instead of a UDP service