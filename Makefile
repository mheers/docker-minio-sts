all: build-sts build-client

include .env
export

build-sts:
	docker build -t mheers/minio-sts .

build-client:
	docker build --build-arg MINIO_CLIENT_VERSION=$(MINIO_CLIENT_VERSION) -t mheers/minio-client:$(MINIO_CLIENT_VERSION) -f Dockerfile.client .

push-sts:
	docker push mheers/minio-sts

push-client:
	docker push mheers/minio-client:$(MINIO_CLIENT_VERSION)
