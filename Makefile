docker-server:
	GOOS=linux go build -o kubeyaml-server ./cmd/server

kubeyaml:
	go build -o kubeyaml ./cmd/kubeyaml

kubeyaml-server:
	go build -o kubeyaml-server ./cmd/server

docker:
ifndef DOCKER_TAG
	$(error "DOCKER_TAG must defined, example format: DOCKER_TAG=your-company/kubeyaml:latest")
endif
	GOOS=linux go build -o kubeyaml ./cmd/kubeyaml
	docker build -f Dockerfile --tag=$(DOCKER_TAG) .

.PHONY: clean docker

clean:
	rm -f kubeyaml kubeyaml-server
