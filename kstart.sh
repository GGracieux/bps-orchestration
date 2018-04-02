# Configure gcloud access
gcloud config set project bagpipescores
gcloud config set compute/zone europe-west1-b
gcloud container clusters get-credentials bps-cluster

# -- Deleting services
kubectl delete service gateway-web
kubectl delete service lilypond-web
kubectl delete service midi2mp3-web

# Deleting deployments
kubectl delete deployments gateway-web
kubectl delete deployments lilypond-web
kubectl delete deployments midi2mp3-web
