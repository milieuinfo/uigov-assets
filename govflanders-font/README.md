# govflanders-font

I.h.k.v. webuniversum voorziet Digitaal Vlaanderen (DV) fonts (zie eventueel https://overheid.vlaanderen.be/webuniversum/v3/). De frontend toepassingen van
Departement Omgeving maken gebruik van deze fonts, deze worden momenteel centraal ter beschikking gesteld op de CDN.

DV released echter geregeld nieuwe versies en daar kan een nieuw font inzitten. Omdat 1 van de fonts icoontjes bevat en nieuwe icoontjes op een random plaats
worden toegevoegd maakt dit dat het icoontjes font niet backwards compatibel is. Om die rede is er nood om de fonts geversioneerd beschikbaar te stellen.

## Legacy situatie

Er zijn 2 plaatsen waaruit de fonts gebruikt worden (en dus staan):

Voor het text font in de varianten italic / sans / serif  
https://cdn.omgeving.vlaanderen.be/vlaanderen-font-new/LATEST/font/flanders/

Voor het iconfont  
https://cdn.milieuinfo.be/vlaanderen-font/LATEST/font/iconfont/3.12.23/

**Belangrijk**: dit moet blijven zoals het is! Alle huidige toepassingen maken gebruik van deze locaties, het is dus zeer belangrijk dat die fonts onder de
desbetreffende url's beschikbaar blijven! Er mag zeker ook geen nieuwe versie op die plaatsen gezet worden.

**Opmerking 1**: de versie problematiek speelt enkel voor 'iconfont', voor het 'gewone' font zou er een nieuwe versie mogen komen onder LATEST

**Opmerking 2**: de 2 CDN root folders (cdn.omgeving.vlaanderen.be en cdn.milieuinfo.be) zijn onderling inwisselbaar, alles is onder beide beschikbaar, beide
locaties bestaan voor CORS ondersteuning

## Nieuwe situatie

Als er nood is aan een nieuwe font versie:

- omdat er nieuwe icoontjes zijn bijgekomen
- omdat er ge-upgrade wordt naar een hoger DV versie

Dan dienen:

- de folders 'flanders' en 'iconfont' overgenomen te worden uit 'node_modules/@govflanders/vl-ui-core/src/font'
- het versie-nummer van vl-ui-core moet overgenomen worden als versie in de package.json van deze module
- dit alles moet ge-commit worden met een relevante boodschap en ge-rebased op main
- de feitelijke package moet gepubliceerd worden naar artifactory: 'npm run release'  
  -> om dit te kunnen vanaf een lokale machine moet je create rechten hebben op local-npm  
  -> je dient expliciet op https://repo.omgeving.vlaanderen.be/artifactory/api/npm/local-npm/ in te loggen om te kunnen publiceren
- nadien dient het 'infra' team op de hoogte gebracht worden, deze zullen er voor zorgen dat de nieuwe versie beschikbaar komt onder
  https://cdn.omgeving.vlaanderen.be/domg/govflanders-font  
  -> dit zorgt er ook voor dat onder LATEST de nieuwste versie beschikbaar komt
