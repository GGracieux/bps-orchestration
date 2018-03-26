# Control param nb
if [ "$#" -ne 1 ]; then
    echo "Usage $0 [LOCAL-DOCKER_IMAGE]"
    exit 1
fi

# Tag & push to dockerhub
docker login
docker tag $1 teuki/$1
docker push teuki/$1

# Tag & push to gcloud
docker tag $1 eu.gcr.io/bagpipescores/$1
gcloud docker -- push eu.gcr.io/bagpipescores/$1