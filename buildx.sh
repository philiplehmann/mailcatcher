docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

docker buildx create --platform linux/arm64,linux/amd64,linux/ppc64le,linux/s390x,linux/arm/v7,linux/arm/v6 --name mailcatcher-builder
docker buildx use mailcatcher-builder
docker buildx build --push --no-cache --platform=linux/arm64,linux/amd64,linux/ppc64le,linux/s390x,linux/arm/v7,linux/arm/v6 --tag=philiplehmann/mailcatcher:v0.8.2 .

docker buildx imagetools create registry.hub.docker.com/philiplehmann/mailcatcher:v0.8.2 --tag registry.hub.docker.com/philiplehmann/mailcatcher:latest