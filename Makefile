.PHONY: all
all: build

.PHONY: build
build: keycloak/providers/cas-provider.jar

keycloak/providers/cas-provider.jar:
	./build.sh

.PHONY: dev
dev: build
	docker compose up -d

.PHONY: clean
clean:
	${RM} -r .build/keycloak-cas-main .build/keycloak-cas-main.zip .build/keycloak-cas-target
	docker compose down
	sudo ${RM} -r keycloak/providers/cas-provider.jar postgres
