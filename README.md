# bpscores-orchestration
Orchestration files for bagpipe-score

## Run with Docker compose
The docker-compose file uses docker images stored on dockerhub.
- [teuki/bagpipe-scores](https://hub.docker.com/r/teuki/bagpipe-scores/) 
- [teuki/lilypond-api](https://hub.docker.com/r/teuki/lilypond-api/) 
- [teuki/midi2mp3-api](https://hub.docker.com/r/teuki/midi2mp3-api/) 

Command  :
```bash
docker-compose up
```

## Kubernetes
Kubernetes yaml files uses docker images stored on google cloud.  Those are the actual files used in bagpipe-scores gcloud kubernetes cluster.

Command :
```bash
# Instantiates deployments
kubectl create -f lilypond-web-deployment.yaml
kubectl create -f midi2mp3-web-deployment.yaml
kubectl create -f gateway-web-deployment.yaml

# Instantiates services for API pods
kubectl create -f lilypond-web-service.yaml
kubectl create -f midi2mp3-web-service.yaml

# Instantiates gateway-web service with exposition on static IP pointed by bagpipe-scores.com DNS
kubectl expose -f gateway-web-service.yaml --type "LoadBalancer" --load-balancer-ip='104.199.33.49'
```
