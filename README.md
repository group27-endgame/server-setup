# Server setup

## Installation

### [Install docker](https://docs.docker.com/engine/install/debian/)
 
#### Set up the repository

1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:

```
sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

2. Add Docker’s official GPG key:

```
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

3. Use the following command to set up the repository:

```
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

#### Install Docker Engine

```
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

### Run init script

To install containers as MSSQL and nginx-proxy-manager, init script is needed to be run. To do this, run this command:
```
docker compose up -f docker-compose.init.yml -d
```

# Directory tree

```bash
opt
│   .env
│   deploy.sh
│   docker-compose.init.yml
│
└───advella
│   │   .env
│   │   docker-compose.prod.yml
│   └───advella-backend
│       │   ...
│   └───advella-frontend-webapp
│       │   ...
│   └───advella-frontend-webapp-admin
│       │   ...
```
