Artist-manager (PW-WebApp)
==============
Cette application permet d'interroger les bases de données LastFm / Deezer afin d'en extraire 
les informations d'un artiste et des artistes équivalents.


Objectifs
==============
Artist-Manager permet d'en apprendre plus sur les artistes et leurs similaires (artistes équivalents).
On y découvre l'ensemble des chansons les plus connus des artistes et les evenements auquel ils participeront.
Les similaires nous permettent d'en apprendre plus sur le genre musical auquel l'artiste appartient.

Packaging
==============
Deux composants :
<ul>
  <li><a href='https://github.com/Aktarel/artist-manager-model'>PW-Model : EJB+Model </a></li>
  <li>PW-WebApps : Application WEB</li>
</ul>

=> Le deploiement se fait à l'aide de ant qui deploie automatiquement l'archive ear (jar + war)

Le contexte de l'application par défault est : progWeb2013.

Vous pouvez le modifier à tout moment via le fichier XML : application.xml

Instructions
==================
   <h3>Unix</h3>
   <h4> Installer JDK </h4>
   <p> cmd </p>
    
    <h4> Installer JBoss AS 6 </h4>
  
  <h3>Windows</h3>


Auteurs
=============
Deux étudiants en école d'ingénieur à l'ESIEA
<ul>
  <li>Nicolas Lebec</li>
  <li><a href="https://github.com/moigoule"> Remy Ouadah</a></li>
</ul>
