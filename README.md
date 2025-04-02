# connect.eirb.fr

Ce dépôt permet de centraliser le code associé au site [connect.eirb.fr](https://connect.eirb.fr)

L'application est une version légèrement modifiée de [keycloak](https://www.keycloak.org)
pour les besoins d'Eirbware.

## Lancer l'application

Vous pouvez utiliser le `Makefile` ou lancer l'application manuellement, après
le lancement, vous pourrez accéder à `keycloak` via [http://localhost:8080](http://localhost:8080)

### Avec `GNU make`

```sh
make dev
```

### Mannuellement

```sh
./build.sh  # Compile the cas provider lib once
docker compose up -d
```

