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

# This will download from Portal
#sudo make get-mda
# You provide the mda in the Repo , downloaded to vm. This copies it to the docker-mendix-buildpack/downloads directory
sudo make cp-mda
sudo make build-image
sudo make run-container-hsql
