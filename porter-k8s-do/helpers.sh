#!/usr/bin/env bash
set -euo pipefail

install() {
  echo Hello World
}

upgrade() {
  echo World 2.0
}

uninstall() {
  echo Goodbye World
  CLUSTER="example"
  doctl compute load-balancer delete --force $(kubectl get svc doks-example -o jsonpath="{.metadata.annotations.kubernetes\.digitalocean\.com/load-balancer-id}")
  yes | doctl k8s cluster delete ${CLUSTER}
}

create-cluster() {
  CLUSTER="example"
  SERVICE="doks-example"
  CONTEXT="do-nyc1-${CLUSTER}"
  doctl k8s cluster create ${CLUSTER}
  kubectl --context ${CONTEXT} apply -f manifest.yaml

}


ensure-config() {
    if [ ! -f "/root/.kube/config" ]; then
      echo "kubeconfig not found"
      exit 1
    else
      cat "/root/.kube/config"
    fi
}

check-lb(){
kubectl get svc doks-example -o jsonpath="{.metadata.annotations.kubernetes\.digitalocean\.com/load-balancer-id}"
}

# Call the requested function and pass the arguments as-is
"$@"
