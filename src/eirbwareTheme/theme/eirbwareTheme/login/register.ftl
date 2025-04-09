<!DOCTYPE html>
<html lang="fr">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>${msg("EirbConnect",(realm.displayName!''))}</title>
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
        <img src="${url.resourcesPath}/img/EirbConnectLogo.svg" alt="EirbConnect logo">
        <h1>EirbConnect</h1>
      </div>



    </div>

    <div class="form-container">

    <form method="POST" action="${url.registrationAction}" class="form">


        <h1 class="form-title">Créer un compte EirbConnect</h1>

        <div class="form-group">

            <p>
                Ces informations vous permettront d'accéder à votre compte EirbConnect après la suppression de votre
                compte CAS. N'oublié pas ce mot de passe ni ce login associé à votre compte EirbConnect.
            </p>

            <div class="input-group">

                <label for="username">Nom d'utilisateur</label>
                <input type="text" name="username" required><br><br>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required><br><br>

                <label for="password">Mot de passe :</label>
                <span class="helper-text">Votre mot de passe doit contenir au moins 8 caractères et être différent de
                    votre mot de passe CAS</span>
                <input type="password" id="password" name="password" required><br><br>
            </div>


            
            <#if recaptchaRequired?? && !(recaptchaVisible!false)>
                    <script>
                        function onSubmitRecaptcha(token) {
                            document.getElementById("kc-register-form").requestSubmit();
                        }
                    </script>
                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <button class="btn-full" 
                            data-sitekey="${recaptchaSiteKey}" data-callback='onSubmitRecaptcha' data-action='${recaptchaAction}' type="submit">
                            ${msg("doRegister")}
                        </button>
                    </div>
                <#else>
                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <input class="btn-full" type="submit" value="${msg("doRegister")}"/>
                    </div>
                </#if>
        </div>


        </div>
    </form>
</div>

<style>
    .helper-text {
        font-size: 0.8em;
        color: var(--text-default-grey);
    }
</style>


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
