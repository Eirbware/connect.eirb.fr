.PHONY: all
all: build

.PHONY: build
build: keycloak/providers/eirbwareTheme.jar

keycloak/providers/cas-provider.jar:
	./build.sh

keycloak/providers/eirbwareTheme.jar: $(shell find src -type f)
	mv $@ $@.tmp
	jar cf $@ -C src/eirbwareTheme .
	rm $@.tmp

.PHONY: dev
dev: build
	docker compose up --force-recreate -d

.PHONY: clean
clean:
	${RM} -r .build/keycloak-cas-main .build/keycloak-cas-main.zip .build/keycloak-cas-target
	docker compose down
	sudo ${RM} -r keycloak/providers/cas-provider.jar postgres
