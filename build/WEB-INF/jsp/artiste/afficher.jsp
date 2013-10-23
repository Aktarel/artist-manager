<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
<title>Resultat de votre recherche : ${artiste.nom}</title>
<jsp:include page="../commun/ressources.jsp" />

<script type="text/javascript">

$(document).ready(function(){
	
	
		
		function resize() { 
			  var img = document.getElementById('imgBiographie');
			  var maxh = 250;
			  var maxw = 250;
			  var ratio = maxh/maxw;  
			  if (img.height/img.width > ratio){  
			    if (img.height > maxh){  
			      img.width = Math.round(img.width*(maxh/img.height));  
			      img.height = maxh;  
			    }  
			  } else {  
			    if (img.width > maxw){  
			      img.height = Math.round(img.height*(maxw/img.width));  
			      img.width = maxw;  
			    }  
			  }
			};
			
			function changeCurrentImage(){  
				var img = document.getElementById('imgBiographie');
			    img.onload = resize;

			    var imgUrl = img.src;
			    var currentImg = document.getElementById('imgBiographie');
			    currentImg.src =imgUrl;
			};
		
		//On resize l'image
		changeCurrentImage();
		
});

function launchAudio(url){
	$("#player").html("<audio autoplay controls style='width:300px;'><source src='"+url+"' type='audio/mpeg'>Votre navigateur ne supporte pas cette fonctionnalité.</audio>");
}

</script>

</head>


<jsp:include page="../commun/entete.jsp" />


</br>
</br>
</br>
<div  id="container">
	<div class="col10">
		<div id='cssmenu'>
			<ul>
				<c:forEach var="similaire" items="${similaires}">
						<li style="background: url(${similaire.urlImage}) center center;"><a
							href="<c:url value="/artiste/read?nom=${similaire.nom} " />"><span>${similaire.nom}</span></a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="col90">
		<h1>
			<c:out value="${artiste.nom}" />
		</h1>
		<section style="padding-top:10px;" id="biographie">
		<h2>Biographie</h2>
		<div class="content-bio-col">
			<p>
				<c:out escapeXml="false" value="${artiste.description}"></c:out>
			</p>
		</div>
		<div id="conteneur-imgBio" class="photo-bio-col">
			<c:forEach var="image" items="${artiste.listeImage}" end="0">
				<img id="imgBiographie" src="${image.url}" alt=""  />
			</c:forEach>
		</div>
		</section>

		</br>
		</br>
		<section style="margin-top: 45px;" id="pistes">
		<h2>Top 20</h2>
		<p>
			<table class="bordered">
				<thead>
					<tr>
						<th>Classement</th>
						<th>Nom Piste</th>
						<th>Auditeurs</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="piste" items="${artiste.listePiste}">
						<tr>
							<td><c:out value="${piste.classement}"></c:out></td>
							<td>
							<c:out value="${piste.nom}"></c:out>
							</td>
							<td><c:out value="${piste.nbListeners}" /></td>
						    <td><c:if test="${piste.urlPreview != null }"><img onclick="launchAudio('${piste.urlPreview}')" alt=""  src="<c:url value="/ressources/images/pictos/play-circle.png" />"></img></c:if> </a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</p>
		</section>
		<section id="evenements">
		<h2>Evenements</h2>
		<p>
			<table class="bordered">
				<thead>
					<tr>
						<th>Titre</th>
						<th>Date</th>
						<th>Adresse</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${fn:length(artiste.listeEvenement) eq 0}">
					<tr>L'artiste ne possède pas d'évenements</tr>
				</c:if>
			<c:if test="${fn:length(artiste.listeEvenement) gt 0}">
				<c:forEach var="evenement" items="${artiste.listeEvenement}">
					<tr>
								<td>${evenement.nom}</td>
								<td>${evenement.date}</td>
								<td>${evenement.adresse}</td>
							    <td><c:if test="${evenement.adresse != null}"><a target="blank" href="https://maps.google.com/maps?z=7&t=m&q=${evenement.adresse}" ><img alt="" width="32" height="32"  src="<c:url value="/ressources/images/pictos/google-map.png" />"></img></a></c:if></td>
					</tr>
	 			</c:forEach>
 			</c:if>
 			</tbody>
 				</table>
		
		</p>
		</section>
		</br>
	</div>
</div>
</html>