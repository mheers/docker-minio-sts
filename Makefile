all: build build-client

build:
	docker build -t mheers/minio-sts .

build-client:
	docker build -t mheers/minio-client  -f Dockerfile.client .

push:
	docker push mheers/minio-sts
	docker push mheers/minio-client
