<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="abstract-entete">
	<div class="entete">
		<ul class="entete-nav">
		<form id="searchForm" method="post"	action="<c:url value="/artiste/read" />">
			<li class="logo"><a href="<c:url value="/" />">Artist
					Manager</a></li>
			<li id="searchFormDiv">
					<input id="searchFormInput" type="text" list="artistes"
						placeholder=" Entrez un nom d'artiste" size="30" name="nom"
						pattern="[\w|\s|$|'|é|è|-]+" />
			</li>
			<li id="searchButtonLi" >
				<button id="searchButton"></button>
			</li>
		</form>
		</ul>
	</div>
</div>