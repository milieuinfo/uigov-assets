# TinyMCE

## Inleiding

Om tinymce te kunnen gebruiken moet er vanuit code verwezen worden naar de locatie van de assets van tinymce. Doordat
er in runtime verwezen wordt naar deze locatie komen de assets niet in de bundel terecht bij het gebruik van een module 
bundler zoals Webpack.  
Om die rede is er nood om de assets geversioneerd beschikbaar te stellen.


## Legacy Situatie

De assets worden op de webserver geplaatst van de toepassing die tinymce gebruikt in de folder 
**/node_modules/tinymce**, vanuit code wordt er verwezen naar deze locatie.


## Nieuwe Situatie

Vanuit code wordt er voortaan verwezen naar de locatie van de assets op de CDN:  
https://cdn.omgeving.vlaanderen.be/domg/tinymce/

Als er nood is aan nieuwe assets omdat er ge-upgrade wordt naar een hogere versie van tinymce, dan dienen:

- de assets en folderstructuur van de specifieke versie van tinymce overgenomen te worden
- het versie-nummer van tinymce moet overgenomen worden als versie in de package.json van deze module
- dit alles moet ge-commit worden met een relevante boodschap en ge-rebased op main
- de feitelijke package moet gepubliceerd worden naar artifactory: 'npm run release'  
  -> om dit te kunnen vanaf een lokale machine moet je create rechten hebben op local-npm  
  -> je dient expliciet op https://repo.omgeving.vlaanderen.be/artifactory/api/npm/local-npm/ in te loggen om te kunnen 
     publiceren
- nadien dient het 'infra' team op de hoogte gebracht worden, deze zullen er voor zorgen dat de nieuwe versie 
  beschikbaar komt onder https://cdn.omgeving.vlaanderen.be/domg/tinymce/  
  -> dit zorgt er ook voor dat onder LATEST de nieuwste versie beschikbaar komt
