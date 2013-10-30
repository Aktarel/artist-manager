<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
<title>Bienvenue sur le projet Web 2013</title>
<jsp:include page="commun/ressources.jsp" />

</head>



<jsp:include page="commun/enteteHome.jsp" />


</br>
</br>
</br>
</br>
<div id="container">
	<div class="col10"></div>
	<div class="col90">
		<h2>Bienvenue sur le projet web 2013</h2>
		<p>
			Ce gestionnaire d'artistes va vous permettre de découvrir des artistes
			et des genres musicaux nouveaux !


			Vous pouvez également écouter les meilleures oeuvres de vos artistes préférés.
			Enfin les évênements auxquels
			participent les artistes (festivals / concerts) sont affichés en bas
			du descriptif de l'artiste. Un lien vous indique l'emplacement de
			l'évênement. N'hésitez pas à vous servir de la barre de raccourcis
			fixe pour naviguer dans la page ! <br>
				<p>Bonne navigation !</p>
		</p>
		<h2>Top 20 des artistes les plus vus</h2>
		<table class="bordered">
			<thead>
				<tr>
					<th>Nom Artiste</th>
					<th>Views</th>
					<th>Favoris</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(topArtistes) eq 0}">
					<tr>
						<td>Pas encore d'artiste dans la base :(</td>
					</tr>
				</c:if>
				<c:if test="${fn:length(topArtistes) gt 0}">
					<c:forEach var="artiste" items="${topArtistes}">
						<tr>
								<td><a href="<c:url value="/artiste/read?nom=${artiste.nom}"/>">${artiste.nom}</a></td>
								<td>${artiste.popularity}</td>
								<td>${fn:length(artiste.fans)}</td>
								<td><a href="<c:url value="/vote?nom=${artiste.nom}" />"><img alt="Votez!" src="<c:url value="/ressources/images/pictos/star.png"/>" /></a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<h2>Auteurs</h2>
		<p>
			&bull; <a style="color: blue;"
				href="https://www.github.com/Aktarel">Nicolas Lebec</a>
				<br />
			&bull; <a style="color: blue;"
				href="https://www.github.com/Moigoule">Remy Ouadah</a>
		</p>
	</div>
</div>


<datalist id="artistes"> <c:if
	test="${fn:length(nomArtistes) gt 0}">
	<c:forEach var="nom" items="${nomArtistes}">
		<option value="${nom}" />
	</c:forEach>
</c:if> </datalist>


</html>
