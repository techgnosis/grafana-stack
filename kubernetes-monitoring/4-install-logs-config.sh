cat <<'EOF' | NAMESPACE=kubernetes-monitoring /bin/sh -c 'kubectl apply -n $NAMESPACE -f -'

kind: ConfigMap
metadata:
  name: grafana-agent-logs
apiVersion: v1
data:
  agent.yaml: |    
    metrics:
      wal_directory: /tmp/grafana-agent-wal
      global:
        scrape_interval: 60s
        external_labels:
          cluster: cloud
      configs:
      - name: integrations
        remote_write:
        - url: https://prometheus-prod-10-prod-us-central-0.grafana.net/api/prom/push
          basic_auth:
            username: username
            password: password
    integrations:
      prometheus_remote_write:
      - url: https://prometheus-prod-10-prod-us-central-0.grafana.net/api/prom/push
        basic_auth:
          username: username
          password: password      
    logs:
      configs:
      - name: integrations
        clients:
        - url: https://logs-prod3.grafana.net/loki/api/v1/push
          basic_auth:
            username: username
            password: password
          external_labels:
            cluster: cloud
        positions:
          filename: /tmp/positions.yaml
        target_config:
          sync_period: 10s
        scrape_configs:
        - job_name: integrations/kubernetes/pod-logs
          kubernetes_sd_configs:
            - role: pod
          pipeline_stages:
            - docker: {}
          relabel_configs:
            - source_labels:
                - __meta_kubernetes_pod_node_name
              target_label: __host__
            - action: labelmap
              regex: __meta_kubernetes_pod_label_(.+)
            - action: replace
              replacement: $1
              separator: /
              source_labels:
                - __meta_kubernetes_namespace
                - __meta_kubernetes_pod_name
              target_label: job
            - action: replace
              source_labels:
                - __meta_kubernetes_namespace
              target_label: namespace
            - action: replace
              source_labels:
                - __meta_kubernetes_pod_name
              target_label: pod
            - action: replace
              source_labels:
                - __meta_kubernetes_pod_container_name
              target_label: container
            - replacement: /var/log/pods/*$1/*.log
              separator: /
              source_labels:
                - __meta_kubernetes_pod_uid
                - __meta_kubernetes_pod_container_name
              target_label: __path__
        
    
EOF