<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
<title>Artiste : ${artiste.nom}</title>
<jsp:include page="../commun/ressources.jsp" />

</head>


<jsp:include page="../commun/entete.jsp" />


</br>
</br>
<h1>
	<c:out value="${artiste.nom}" />
</h1>

<h2>Sa description</h2>
<p>
	<c:out escapeXml="false" value="${artiste.description}"></c:out>

</p>
<br />


<h2>Ses meilleurs chansons</h2>
<p>
	<table class="bordered">
		<thead>
			<tr>
				<th>Classement</th>
				<th>Nom Piste</th>
				<th>Nombre auditeurs</th>
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

<h2>Ses plus belles photos</h2>
<p>
	<c:forEach var="image" items="${artiste.listeImage}">
		<img width="250" height="250" src="${image.url}" alt="" /> &nbsp; &nbsp;
 			</c:forEach>
</p>
</html>