MANIFEST_URL=https://raw.githubusercontent.com/grafana/agent/v0.24.0/production/kubernetes/agent-loki.yaml \
NAMESPACE=kubernetes-monitoring \
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/grafana/agent/v0.24.0/production/kubernetes/install-bare.sh)" | kubectl apply -f -