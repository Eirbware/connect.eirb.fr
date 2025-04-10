<#import "footer.ftl" as loginFooter>
<#import "header.ftl" as loginHeader>

<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
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
        <div class="app">
            <@loginHeader.content/>

            <main id="kc-content">
                <div id="kc-content-wrapper">
                    <#nested "form">
                </div>
            </main>

            <@loginFooter.content/>
        </div>
    </body>

</html>
</#macro>
