## Aug 2023 - Install all pre-reqs - Only needed first time on a new VM

sudo apt-get update

### Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run
sudo service docker start
sudo docker run hello-world


sudo apt-get install unzip
# sudo apt-get install docker-compose-plugin
sudo apt  install docker-compose

sudo apt install make
