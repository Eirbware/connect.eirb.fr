<#import "template.ftl" as layout>
      
<@layout.registrationLayout>
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

            <#list social.providers as p>
              <button id="social-cas" onclick="window.location.href='${p.loginUrl}'" class="btn-cas">
                <img src="${url.resourcesPath}/img/bordeaux_inp_white.svg" alt="bx_inp_logo" class="logo">
                <p>
                  S'identifier avec <br>le <b>CAS</b>
                </p>
              </button>
            </#list>
          
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
	      </form>

      </div>
</@layout.registrationLayout>