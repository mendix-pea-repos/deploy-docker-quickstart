. ./env.sh

echo $AppID $packageId 
# Retrieve all the packages
curl -X GET https://deploy.mendix.com/api/1/apps/$AppID/packages -H "Mendix-Username: ${mendixUserName}" -H "Mendix-Apikey: ${mendixApiKey}"

# Retrieve a specific package

echo "Download"

curl -X GET https://deploy.mendix.com/api/1/apps/$AppID/packages/${packageId}/download -H "Mendix-Username: ${mendixUserName}" -H "Mendix-Apikey: ${mendixApiKey}" --output downloads/$AppID.mda

# Retrieve API - Get's the url 
#curl -X GET "https://deploy.mendix.com/api/1/apps/$AppID/packages/${packageId}?url=true" -H "Mendix-Username: ${mendixUserName}" -H "Mendix-Apikey: ${mendixApiKey}"
