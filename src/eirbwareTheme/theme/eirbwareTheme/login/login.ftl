<!DOCTYPE html>
<html lang="fr">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>${msg("Keycloak",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="${url.resourcesPath}/css/style.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">
  </head>

  <body>
    <div class="header">

      <div class="header__logo" onclick="window.location.href='/'">
        <img src="${url.resourcesPath}/img/keycloak.svg" alt="Keycloak logo">
        <h1>Keycloak</h1>
      </div>



    </div>

    <div class="content">
      

      <div class="form-container">

	<form action="${url.loginAction}" method="post" class="form">

          <div class="form-group">

            <div>

              <h1>Se connecter avec le CAS</h1>

              <p>
                Le CAS est la solution proposée par Bordeaux INP pour se connecter à l’ensemble des sites
                pédagogiques.
              </p>
            </div>

            <button onclick="window.location.href='/api/cas_login?service_url=?{service_url}'" class="btn-cas">
              <img src="${url.resourcesPath}/img/bordeaux_inp_white.svg" alt="bx_inp_logo" class="logo">
              <p>
                S'identifier avec <br>le <b>CAS</b>
              </p>
            </button>
          </div>

          <hr class="hr-text" data-content="ou">


          <div class="form-group">

            <h1>Se connecter avec un mot de passe</h1>
            <div class="input-group">
		<label for="username">Identifiant CAS :</label>
		<input type="text" id="username" name="username" required><br><br>
		
		<label for="password">Mot de passe Keycloak :</label>
		<input type="password" id="password" name="password" required><br><br>		
              </div>
	      
	      
              <#if error??>		  
		<div class="error">
		 <p>${error}</p>
		</div>
	     </#if>
			  
			  <button type="submit" class="btn-full">Se connecter</button>
			  </div>
			  
			  <hr>
			  <div class="form-group">

            <h1>Vous n’avez pas de compte ?</h1>

            <a href="/register">
              <button type="button" class="btn-outlined btn-full">
                Créer un compte
              </button>
            </a>
          </div>

	</form>

      </div>


    </div>

    <div class="footer">
      <div class="logo">
        <img src="https://assos.eirb.fr/logos/x256/eirbware.png" />
      </div>
      <div class="links">
        <div class="link">
          <a href="https://eirb.fr" target="_blank" class="text">eirb.fr</a>
          <img src="${url.resourcesPath}/img/ungroup.svg" alt="indicator" class="indicator">
        </div>
        <div class="link">
          <a href="https://eirbware.eirb.fr" target="_blank" class="text">eirbware.eirb.fr</a>
          <img src="${url.resourcesPath}/img/ungroup.svg" alt="indicator" class="indicator">
        </div>
        <div class="link">
          <a href="https://bde.eirb.fr" target="_blank" class="text">bde.eirb.fr</a>
          <img src="${url.resourcesPath}/img/ungroup.svg" alt="indicator" class="indicator">
        </div>
      </div>
    </div>


  </body>

</html>
