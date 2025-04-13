.PHONY: all
all: build

.PHONY: build
build: keycloak/providers/cas-provider.jar keycloak/providers/eirbwareTheme.jar

keycloak/providers/cas-provider.jar:
	./build.sh

keycloak/providers/eirbwareTheme.jar: $(shell find src -type f)
	mv $@ $@.tmp
	jar cf $@ -C src/eirbwareTheme .
	rm $@.tmp

.PHONY: shell-connect
shell-connect:
	docker compose up -d
	docker exec -it connect bash

.PHONY: dev
dev: build
	docker compose up --force-recreate -d

.PHONY: clean
clean:
	docker compose down

.PHONY: mrproper
mrproper:
	${RM} -r .build/keycloak-cas-main .build/keycloak-cas-main.zip .build/keycloak-cas-target
	docker compose down
	docker rm -f connect-build-dep-container || true
	docker rmi -f connect-build-dep || true
	sudo ${RM} -r keycloak/providers/cas-provider.jar postgres
