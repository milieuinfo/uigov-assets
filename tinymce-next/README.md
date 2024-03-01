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
- de feitelijke package moet gepubliceerd worden naar artifactory
  -> publiceren vanaf een lokale machine kan niet meer
  -> de makkelijkste manier is de package lokaal te maken door in de folder te gaan staan en het commando `npm pack`
     uit te voeren - verifieer dat de .tgz een 'package' folder bevat om de publicatie naar de CDN te laten lukken
  -> je kan de package dan expliciet uploaden naar https://repo.omgeving.vlaanderen.be/artifactory/api/npm/local-npm
     door in te loggen in Artifactory en daar de Deploy actie uit te voeren (onder voorbehoud dat je de rechten hebt)
- nadien dient het 'infra' team op de hoogte gebracht te worden (via een ticket), deze zullen er voor zorgen dat de
  nieuwe versie beschikbaar komt onder https://cdn.omgeving.vlaanderen.be/domg/tinymce/  
  -> dit zorgt er ook voor dat onder LATEST de nieuwste versie beschikbaar komt
  -> we willen wel niet refereren naar die LATEST, daar we dan 'auto-magische' upgrades zouden krijgen


## TinyMCE-next

Deze folder bevat de versie van TinyMCE die gebruikt wordt in de vl-textarea-rich-next.
Doordat het oude vl-textarea component nog bestaat is het noodzakelijk om 2 verschillende versies van TinyMCE te voorzien.
