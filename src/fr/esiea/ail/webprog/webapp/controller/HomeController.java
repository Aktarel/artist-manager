package fr.esiea.ail.webprog.webapp.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import manager.GestionnaireRessource;
import manager.Ressources;
import modele.Artiste;
import modele.Utilisateur;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * 
 * Controller appelle lors de l'arrive sur l'application web
 * Mapping dans l'url : "<contexte>/" donc tout
 * @author nicolas
 *
 */
@Controller
@RequestMapping("/")
public class HomeController {

	private 	GestionnaireRessource manager;
	private InitialContext ic;

	/**
	 * Declaration des parametres jndi pour se brancher sur les bonnes interfaces
	 * @throws NamingException
	 */
	public HomeController() throws NamingException {

		Properties env = new Properties();
		env.setProperty("java.naming.factory.initial",
				"org.jnp.interfaces.NamingContextFactory");
		env.setProperty("java.naming.factory.url.pkgs",
				"org.jboss.naming:org.jnp.interfaces");
		env.setProperty("java.naming.provider.url", "jnp://localhost:1099");
		this.ic = new InitialContext(env);
		this.manager  = (GestionnaireRessource) ic.lookup("Ear01/RessourceManagerImpl/local");
	}
	
	/**
	 * Premiere methode appelle lorsque l'utilisateur arrive sur le site sans preciser d'url de recherche d'artiste
	 * @param modele : les donnees passees en session
	 * @return string : renvoie vers page accueil
	 * @throws NamingException
	 */
	@RequestMapping("/")
	public String home(Model modele) throws NamingException{
		
	
		
		List<String> nomsArtistes = (List<String>) manager.get(Ressources.artistesToString,"50");
		List<Artiste> topArtistes = (List<Artiste>) manager.get(Ressources.topArtistes,"20");
		
		Collections.sort(topArtistes,new Comparator<Artiste>(){
			public int compare(Artiste o1, Artiste o2) {
				if(o1.getPopularity()>o2.getPopularity()){
					return -1;
				}
				else if(o1.getPopularity()<o2.getPopularity()){
					return 1;
				}
				else{
					return 0;
				}
				
			}
		});
		
		modele.addAttribute("nomArtistes",nomsArtistes);
		modele.addAttribute("topArtistes",topArtistes);
		return "accueil";
	}
	
	/**
	 * Methode permettant de voter de l'accueil
	 * On recupere un artiste en mode EAGER (toute les entites lie a cette entite)
	 * @param nom
	 * @param modele
	 * @param request
	 * @return
	 * @throws NamingException
	 */
	@RequestMapping("/vote")
	public String voter(@RequestParam String nom,Model modele,HttpServletRequest request) throws NamingException{

		Artiste artiste = (Artiste) manager.get(Ressources.artiste, nom,"vote");
		Utilisateur user = (Utilisateur) request.getAttribute("utilisateur");
		user.addFavoris(artiste);
		manager.update(Ressources.utilisateur, user);
		return home(modele);
	}
}
