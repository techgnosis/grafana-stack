helm install ksm kube-state-metrics \
--repo https://prometheus-community.github.io/helm-charts \
--set image.tag=v2.4.2 \
-n kubernetes-monitoring