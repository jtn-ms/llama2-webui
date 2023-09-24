https://medium.com/@powabnyantykwark/run-llama-2-based-models-with-docker-2b8017a16216

```sh
[build.alien]
$ docker build -t llama2-webui . -f Dockerfile.pytorch

[build.custom]
$ docker build -t llama2-webui . -f Dockerfile.noconda

[build.default]
$ docker build -t llama2-webui .

[run.webservice]
$ docker run -dit --name llama2-webui-app -p 7861:7860 --restart unless-stopped llama2-webui:latest

[run.bash]
$ docker run -dit --name llama2-webui-app -p 7861:7860 llama2-webui:latest bash
$ docker container attach llama2-webui-app

[container2image]
$ docker commit llama2-webui-app llama2-webui:latest

[clean]
docker volume ls -qf "dangling=true" | xargs -r docker volume rm
docker builder prune -a
# List all containers (including stopped ones)
docker ps -a
# Remove all stopped containers
docker container prune
# List all images (including dangling and unused ones)
docker images -a
# Remove all dangling and unused images
docker image prune -a
```

```sh
$ docker-compose up
```

https://github.com/jtn-ms/frequently-used-cmds/blob/master/Docker.md
```sh
$ docker run -it -v ~/.hsd:/root/.hsd -v ~/.hscli:/root/.hscli ${DOCKER_IMAGE}:latest hsd init --chain-id $(CHAIN_ID) 
$ docker run -it -v ~/.hsd:/root/.hsd -v ~/.hscli:/root/.hscli ${DOCKER_IMAGE}:latest hsd start --minimum-gas-prices=$(MINIMUM_GAS_PRICES)
```