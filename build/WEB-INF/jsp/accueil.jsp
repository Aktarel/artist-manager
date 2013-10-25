<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
<title>Bienvenue sur le projet Web 2013 ESIEA:AIL</title>
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
 		 <table class="bordered">
				<thead>
					<tr>
						<th>Nom Artiste</th>
						<th>Favoris</th>
						<th>Popularite</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${fn:length(topArtistes) eq 0}">
					<tr><td>Pas encore d'artiste dans la base :( </td></tr>
				</c:if>
			<c:if test="${fn:length(topArtistes) gt 0}">
					<tr>
						<c:forEach var="artiste" items="${topArtistes}">
								<td>${artiste.nom}</td>
								<td>${artiste.favoris}</td>
								<td>${artiste.popularity}</td>
							    <td>Voter</td>
					</tr>
	 			</c:forEach>
 			</c:if>
 			</tbody>
 				</table>
	</div>
</div>


<datalist id="artistes">
<c:if test="${fn:length(nomArtistes) gt 0}">
  <c:forEach var="nom" items="${nomArtistes}">
  	<option value="${nom}" />
  </c:forEach>
 </c:if>
</datalist>
	
	
</html>
