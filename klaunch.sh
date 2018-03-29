# Configure gcloud access
gcloud config set project bagpipescores
gcloud config set compute/zone europe-west1-b
gcloud container clusters get-credentials bps-cluster

# Instantiates deployments
kubectl create -f lilypond-web-deployment.yaml
kubectl create -f midi2mp3-web-deployment.yaml
kubectl create -f gateway-web-deployment.yaml

# Instantiates services for API pods
kubectl create -f lilypond-web-service.yaml
kubectl create -f midi2mp3-web-service.yaml

# Instantiates gateway-web service with exposition on static IP pointed by bagpipe-scores.com DNS
kubectl expose -f gateway-web-service.yaml --type "LoadBalancer" --load-balancer-ip='104.199.33.49'
