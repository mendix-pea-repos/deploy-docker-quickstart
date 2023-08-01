# Move to HoME DIrectory
cd ~


sudo apt-get update

### Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run
sudo service docker start
sudo docker run hello-world


sudo apt-get install unzip
# sudo apt-get install docker-compose-plugin
sudo apt  install docker-compose

mkdir dockerdemo
cd dockerdemo
git clone --branch master --config core.autocrlf=false https://github.com/mendix/docker-mendix-buildpack
cd docker-mendix-buildpack/
sudo apt install make
make get-sample
sudo make build-image
sudo make get-sample
sudo make run-container

sudo docker ps
curl -X GET http://localhost:8080

mkdir save
cp * save

cp ../Makefile .
cp ../download.sh .
cp ../env.sh .


make get-mda
sudo make build-image
sudo make get-sample
sudo make run-container
