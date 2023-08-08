##
###
### Aug 2023 - Used to deploy MDA
export PATH=$PATH:.
export targetDir="docker-mendix-buildpack"
echo $targetDir

chmod +x *.sh
if ! command -v docker &> /dev/null
then
    echo "*** docker could not be found.Installing pre-requisites ..."
    installPreReqs.sh
fi

#Does the Directory exist 
if [ ! -d ${targetDir} ]
then
     echo "*** $targetDir does not exist. Downloading Mendix docker buildpack ...  "
     mxDockerSetup.sh
fi

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
