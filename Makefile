IMAGE_NAME=week3.5

linux:

	docker build --build-arg OS=linux --build-arg ARCH=${shell dpkg --print-architecture} -t $(IMAGE_NAME) .
	docker run $(IMAGE_NAME)

windows:
	docker build --build-arg OS=windows --build-arg ARCH=$(shell wmic os get osarchitecture | findstr [0-9]) -t $(IMAGE_NAME) .
	docker run $(IMAGE_NAME)
macos:
	docker build --build-arg OS=darwin --build-arg ARCH=$(shell arch) -t $(IMAGE_NAME) .
	docker run -p 8080:8080 $(IMAGE_NAME)
image:
	docker build --build-arg OS=linux --build-arg ARCH=${shell dpkg --print-architecture} -t $(IMAGE_NAME) .
	docker run $(IMAGE_NAME)

clean:
	docker rmi -f $(IMAGE_NAME)