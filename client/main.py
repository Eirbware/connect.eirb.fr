#!python3
from keycloak import KeycloakAdmin
from keycloak import KeycloakOpenIDConnection
import argparse

defaultConfig = {
        "server_url": "https://example.com",
        "username": "eirbware",
        "password": "eirbware",
        "client_id": "eirbwareScript",
        "client_secret_key": "<secret>",
        "realm_name": "eirb",
}

def setup_keycloakadmin(config=defaultConfig):
    keycloak_connection = KeycloakOpenIDConnection(
                            server_url=config["server_url"],
                            username=config["username"],
                            password=config["password"],
                            realm_name=config["realm_name"],
                            user_realm_name=config["realm_name"],
                            client_id=config["client_id"],
                            client_secret_key=config["client_secret_key"],
                            verify=True)

    keycloak_admin = KeycloakAdmin(connection=keycloak_connection)

    return keycloak_admin

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
                    prog='kcaddclient',
                    description="This script create a new client in keycloak\n. It is meant to be used by new_site eirbware's script.",
                    epilog='Text at the bottom of help')

    parser.add_argument('siteName')  # Ex: pix for pix.eirb.fr

    args = parser.parse_args()

    keycloak_admin = setup_keycloakadmin();

    new_client = {
            "clientId": f"{args.siteName}",
            "name": f"{args.siteName}",
            "rootUrl": f"https://{args.siteName}.eirb.fr",
            "adminUrl": f"https://{args.siteName}.eirb.fr",
            "baseUrl": f"https://{args.siteName}.eirb.fr",
            "redirectUris": [
                f"https://{args.siteName}.eirb.fr/*",
                f"http://localhost:8080/*",
                ],
            "webOrigins": [
                f"https://{args.siteName}.eirb.fr/*",
                f"https://localhost:8080/*"
                ],
            "enabled": True,
            "serviceAccountsEnabled": True,
            "authorizationServicesEnabled": True,
    }

    clientid = keycloak_admin.create_client(new_client, skip_exists=True)
    print(f"new clientid  : ${clientid}")



