<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="abstract-entete">
	<div class="entete">
		<ul class="entete-nav">
			<li class="logo"><a href="<c:url value="/" />">Artist
					Manager</a></li>

			<c:if test="${artiste != null}">
				<li class="biographie"><a
					href="<c:url value="/artiste/read?nom=${artiste.nom}#" />">&nbsp;
						&nbsp;</a></li>
				<li class="pistes"><a
					href="<c:url value="/artiste/read?nom=${artiste.nom}#pistes"/>">&nbsp;
						&nbsp;</a></li>
				<li class="evenements"><a
					href="<c:url value="/artiste/read?nom=${artiste.nom}#evenements"/>">&nbsp;
						&nbsp;</a></li>
				<div id="player"></div>
			</c:if>
		</ul>
	</div>
</div>