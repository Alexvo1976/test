echo "Bringing down MM REST API"
docker compose down mm-api

echo "Configuring GIT"
git checkout dev
git pull origin dev

echo "Bringing up MM REST API"
docker compose --env-file ./config/.env.dev up mm-api --build -d
