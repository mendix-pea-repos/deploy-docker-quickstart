VERSION=$(shell cat docker-buildpack.version)
CF_BUILDPACK_VERSION=$(shell cat cf-buildpack.version)
ROOTFS_VERSION=$(shell cat rootfs.version)
ROOTFS_IMAGES=$(patsubst Dockerfile.rootfs.%, rootfs.%, $(wildcard Dockerfile.rootfs.*))
MDA_NAME="cicd-demo.mda"

get-mda:
	if [ -d build ]; then rm -rf build; fi
	if [ -d downloads ]; then rm -rf downloads; fi
	mkdir -p downloads build
	#wget https://s3-eu-west-1.amazonaws.com/mx-buildpack-ci/BuildpackTestApp-mx-7-16.mda -O downloads/application.mpk
	. ./download.sh
	unzip downloads/$(MDA_NAME) -d build/

cp-mda:
	if [ -d build ]; then rm -rf build; fi
	if [ -d downloads ]; then rm -rf downloads; fi
	mkdir -p downloads build
	cp ../mda/${MDA_NAME} downloads
	unzip downloads/$(MDA_NAME) -d build/


rootfs.%: Dockerfile.rootfs.%
	docker build \
	-t mendix/rootfs:$* -f Dockerfile.rootfs.$* .

build-base-images: $(ROOTFS_IMAGES)

build-image:
	docker build \
	--build-arg BUILD_PATH=build \
	--build-arg CF_BUILDPACK=$(CF_BUILDPACK_VERSION) \
	--build-arg ROOTFS_IMAGE=$(ROOTFS_VERSION) \
	-t mendix/mendix-buildpack:$(VERSION) .

test-container:
	tests/test-generic.sh tests/docker-compose-postgres.yml
	tests/test-generic.sh tests/docker-compose-sqlserver.yml
	tests/test-generic.sh tests/docker-compose-azuresql.yml

run-container:
	BUILDPACK_VERSION=$(VERSION) docker-compose -f tests/docker-compose-postgres.yml up

run-container-hsql:
	BUILDPACK_VERSION=$(VERSION) docker-compose -f tests/docker-compose-hsqldb.yml up
