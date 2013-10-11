<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">	
   
    <head>
        <title>Afficher un artiste</title> 
        <jsp:include page="../commun/ressources.jsp" />
	 
    </head>
   
   
   		 <jsp:include page="../commun/entete.jsp" />
    	
 
    	</br>
    	</br>
    	</br>
 		<h1><c:out value="${artiste.nom}" /></h1>
 		
 		<h2>Sa description</h2>
 		<c:out escapeXml="false" value="${artiste.description}"></c:out><br/>
 		
 		
 		<h2>Ses meilleurs chansons</h2>
 		<div>
 			<c:forEach var="piste" items="${artiste.listePiste}" >
 				<c:out value="${piste.classement}"></c:out> | <c:out value="${piste.nom}"></c:out> | <c:out value="${piste.nbListeners}"/><br/>
 			</c:forEach>
 		</div>
 		
 		<h2>Ses plus belles photos</h2>
 		<div>
 			<c:forEach var="image" items="${artiste.listeImage}">
 				<img width="250" height="250" src="${image.url}" alt="" /> &nbsp; &nbsp;
 			</c:forEach>
 		</div>
</html>
