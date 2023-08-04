###
###
### Aug 2023 - Used to deploy MDA
cd docker-mendix-buildpack
mkdir save
cp * save

cp ../Makefile .
cp ../download.sh .
cp ../env.sh .
cp ../tests/docker-compose-hsqldb.yml tests

perl -pi -e 's/^  */\t/' Makefile

sudo make get-mda
sudo make build-image
sudo make run-container-hsql
