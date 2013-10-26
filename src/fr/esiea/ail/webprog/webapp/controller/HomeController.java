package fr.esiea.ail.webprog.webapp.controller;

import java.util.List;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import manager.GestionnaireRessource;
import manager.Ressources;
import modele.Artiste;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


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
	}
	
	/**
	 * Premiere methode appelle lorsque l'utilisateur arrive sur le site sans preciser d'url de recherche d'artiste
	 * @param modele : les donnees passees en session
	 * @return string : renvoie vers page accueil
	 * @throws NamingException
	 */
	@RequestMapping("/")
	public String home(Model modele) throws NamingException{
		
		GestionnaireRessource manager = (GestionnaireRessource) ic.lookup("Ear01/RessourceManagerImpl/local");
		
		List<String> nomsArtistes = (List<String>) manager.get(Ressources.artistesToString,"50");
		List<Artiste> topArtistes = (List<Artiste>) manager.get(Ressources.topArtistes,"20");
		
		modele.addAttribute("nomArtistes",nomsArtistes);
		modele.addAttribute("topArtistes",topArtistes);
		return "accueil";
	}
	
}
