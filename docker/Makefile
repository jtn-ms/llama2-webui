build.standalone:
	# mv ../../../../../models/huggingface.co/LocalModels/Llama-2-7B-Chat-ggml/llama-2-7b-chat.ggmlv3.q4_0.bin .
	docker build -t llama2-webui .
	mv llama-2-7b-chat.ggmlv3.q4_0.bin ../../../../../models/huggingface.co/LocalModels/Llama-2-7B-Chat-ggml/

build.default: build.standalone

build: build.default


run.compose:
	docker-compose up

run.standalone:
	docker run -dit --name llama2-webui-app -p 80:8080 --restart unless-stopped llama2-webui:latest

run.default: run.standalone

run: run.default


stop.container:
	docker container stop llama2-webui-app


access.bash:
	docker run -dit --name llama2-webui-app -p 80:8080 llama2-webui:latest bash
	docker container attach llama2-webui-app

create.access.point:
	docker exec -it llama2-webui-app /bin/bash


inspect.network:
	docker inspect llama2-webui-app

inspect.log:
	docker logs llama2-webui-app


rm.container:
	docker rm llama2-webui-app

rm.img:
	docker rmi llama2-webui

rm.all: rm.container rm.img

clean.caches:
	docker builder prune -a
	docker container prune
	docker image prune -a


chk.all:
	docker ps -a
	docker images