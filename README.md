KCRC Micro-Machine
===

The repo consists of both the website (client) and backed for KCRC MicroMachine.

The backend is a REST API written in Python (FastAPI).

Ngnix is used to serve the static content (in `/client/build`) and is built in React.

## Development Process

### Local Development

- If you don't already have it, ask Michael for a copy of `secrets.zip` and unzip it at the root of the repo.
- Make sure you're on the vpn
- Two Development Workflows:
    - 1) **Client and API Dev**: Run both the API and Client in Docker
        - Make sure Docker is running
        - Run `build_local.sh`
        - run `docker-compose up --build` to rebuild the image and start the container
    - 2) **Client Only Dev**: Run the Client locally while using the Dev/Test API
        - `cd client`
        - `npm run start:dev`

> Note: You may not be able to login to the dev environment 
> until your 7-letter code and creds have been added to the dev db.


### Contributing

Test/Dev changes are promoted to production in the following steps:

- Create a new feature branch based on `dev`
- When ready, open a pull request (but before merging, rebuild `client/build` if any changes to the client have been made)
- If approved, your changes will be merged with `dev`
- Once testing has been approved, the `dev` branch is merged with the `prod` branch


## Deployments

Presently, deployments are done manually via SSH or PuttY.

Prod Server: `lin2dv2nba31`
Test/Dev Server: `lin2dv2nba30`

### Test Deployment Process

This is the current workflow for making changes to the TEST Box.

- [ ] Create a new feature branch based on the `dev` branch
- [ ] When ready for a code review, open a pull request based on `dev`
- [ ] When the code is ready for review, do a final `npm run build:dev` 
- [ ] Commit this final change and merge to `dev`
- [ ] SSH into to dev/prod box
    - [ ] Run `cd /data/repos/kcrc-micromachine`
    - [ ] Run `sudo docker-compose down` to bring down the services
    - [ ] Run `sudo git pull origin dev` to pull in local changes to dev (remember to build the www locally, as there is no NPM on the TEST server)
    - [ ] Run `ENVIRONMENT=dev docker-compose up --build -d` to rebuild the containers and start them as a daemon process

### Prod Deployment Process

Prod deployment is similar, except it only involves pulling in changes from `dev` to `prod`, and rebuilding the docker services on the PROD box.

> Note: In prod, replace `prod` as the value passed to `ENVIRONMENT`.

