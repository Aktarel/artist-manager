<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
<title>Resultat de votre recherche : ${artiste.nom}</title>
<jsp:include page="../commun/ressources.jsp" />

</head>


<jsp:include page="../commun/entete.jsp" />


</br>
</br>
</br>
</br>
<div id="container">


	<div class="col10">
		<div id='cssmenu'>
			<ul>
				<c:forEach var="similaire" items="${similaires}">
					<c:forEach var="image" items="${similaire.listeImage}" end="0">
						<li style="background: url(${image.url}) center center;"><a href="<c:url value="/artiste/read?nom=${similaire.nom} " />"><span>${similaire.nom}</span></a></li>
					</c:forEach>
				</c:forEach>

			</ul>
		</div>
	</div>
	<div class="col90">
		<h1>
			<c:out value="${artiste.nom}" />
		</h1>
		<section id="biographie">
		<h2>Biographie</h2>
		<div class="bio col">
			<p>
				<c:out escapeXml="false" value="${artiste.description}"></c:out>
			</p>
		</div>
		<div class="bio col"></div>
		</section>


		<section id="pistes">
		<h2>Top 20</h2>
		<p>
			<table class="bordered">
				<thead>
					<tr>
						<th>Classement</th>
						<th>Nom Piste</th>
						<th>Auditeurs</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="piste" items="${artiste.listePiste}">
						<tr>
							<td><c:out value="${piste.classement}"></c:out></td>
							<td><c:out value="${piste.nom}"></c:out></td>
							<td><c:out value="${piste.nbListeners}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</p>
		</section>
		<section id="photos">
		<h2>Mosaïque photo</h2>
		<p>
			<c:forEach var="image" items="${artiste.listeImage}">
				<img height="126" src="${image.url}"
					title="Ajoutée le ${image.dateAjoute}" /> &nbsp; &nbsp;
 			</c:forEach>
		</p>
		</section>
		</br>
	</div>
</div>
</html>