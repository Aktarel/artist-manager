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

Il vous suffit de modifier dans le build.xml la propriété 'jboss.dir.install' et référencer le chemin d'installation de JBoss 6. (ou autre conteneur web si configuré)

Le deploiement se fait à l'aide de ant qui deploie automatiquement l'archive ear (jar + war)

Installation
==================
Voir fichier INSTALL

Demarche
==================
L'ensemble des technologies utilisés sont :
<ul> 
<li> Hibernate 3 / JPA 2 : Mapping Monde Objet -> Monde Relationnel</li>
<li> EJB 3.1 : dialogue entre composants plus simple </li>
<li> HSQLDB (Hypersonic DB)</li>
<li> JAXB : Mapping XML -> Monde Objet </li>
<li> Trang : generation de schema XSD à partir du fichier XML </li>
<li> XJC : generateur de classes à partir de fichier XML</li>
<li> Spring MVC : architecture web MVC </li>
<li> JSTL : taglib/balises permettant de manipuler les attributs en sessions facilement </li>
<li> CSS3 : partie style des pages web </li>
<li> HTML5 : balisage permettant d'organiser la page web (utiliser dans ce projet pour lire contenu audio , balises sections ...) </li>
<li> JBOSS ASS 6 : conteneur web qui supporte l'interface EJB et implémente une base de donnée HSQLDB au démarrage </li>
<li> Log4j : librairie gérant les cannaux et priorité des  (seul cannal configué sur la console JBOSS) </li>
<li> Git : gestionnaire de dépot utilisé pour partager le code avec l'équipe</li>
</ul>

Auteurs
=============
Deux étudiants en école d'ingénieur à l'ESIEA
<ul>
  <li><a href="https://github.com/Aktarel">Nicolas Lebec</a></li>
  <li><a href="https://github.com/moigoule"> Remy Ouadah</a></li>
</ul>
