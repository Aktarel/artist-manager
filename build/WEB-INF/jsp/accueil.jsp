<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
<title>Bienvenue sur le projet Web 2013 ESIEA:AIL</title>
<jsp:include page="commun/ressources.jsp" />

</head>


<jsp:include page="commun/entete.jsp" />


</br>

	<h1>Que cherchez vous au juste ?</h1>
	<div style="margin-left:140px;">
	<form action="<c:url value="/artiste/read" />">
		<label for="nom">Nom Artiste</label> <input type="text" name="nom" />
		<input type="submit" value="Valider" />
	</form>
	</div>
</html>
