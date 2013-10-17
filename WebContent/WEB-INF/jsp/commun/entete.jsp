<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="entete">
	<ul class="entete-nav">
		<li class="logo"><a href="<c:url value="/" />">Artist Manager</a></li>
		<li class="biographie"><a href="<c:url value="/artiste/read?nom=${artiste.nom}#" />"  >&nbsp; &nbsp;</a></li>
		<li class="pistes"><a href="<c:url value="/artiste/read?nom=${artiste.nom}#pistes"/>">&nbsp; &nbsp;</a></li>
		<li class="images"><a href="<c:url value="/artiste/read?nom=${artiste.nom}#photos"/>"  >&nbsp; &nbsp;</a></li>
	</ul>
</div>