git clone --branch master --config core.autocrlf=false https://github.com/mendix/docker-mendix-buildpack
cd docker-mendix-buildpack/
make get-sample
sudo make build-image
sudo make get-sample
#sudo make run-container

