# echo "Bringing down NGNIX"
# docker compose down ngnix

# echo "Configuring GIT"
#git checkout dev
#git pull origin dev

cd client

echo "Removing current build dir"
rm -rf ./build

# echo "Installing node"
# npm ci

echo "Building Client"
npm run build:dev


#echo "Bringing up NGNIX"
#docker compose --env-file ./config/.env.dev up ngnix --build -d
