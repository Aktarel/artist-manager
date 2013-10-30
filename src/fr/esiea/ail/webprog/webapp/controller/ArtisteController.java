package fr.esiea.ail.webprog.webapp.controller;

import java.util.Map;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import manager.GestionnaireRessource;
import manager.Ressources;
import modele.Artiste;
import modele.Utilisateur;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * 
 * Controlleur qui gere les artistes de la webapp
 * Dans l'url le controller reagit lorsque <context>/artiste est appele
 * @author nicolas
 *
 */
@Controller
@RequestMapping("/artiste")
public class ArtisteController {

	Logger log = Logger.getLogger(ArtisteController.class);
	
	private GestionnaireRessource manager ;
	private InitialContext ic;

	/**
	 * Declaration des parametres jndi pour se brancher sur les bonnes interfaces
	 * @throws NamingException
	 */
	public ArtisteController() throws NamingException {

		Properties env = new Properties();
		env.setProperty("java.naming.factory.initial",
				"org.jnp.interfaces.NamingContextFactory");
		env.setProperty("java.naming.factory.url.pkgs",
				"org.jboss.naming:org.jnp.interfaces");
		env.setProperty("java.naming.provider.url", "jnp://localhost:1099");
		this.ic = new InitialContext(env);
		this.manager = (GestionnaireRessource) ic
		.lookup("Ear01/RessourceManagerImpl/local");
	}

	
	/**
	 * Interroge l'EJB si l'artiste est present dans la base ou lastfm/deezer
	 * @param nom : l'artiste recherche
	 * @param modele : le modele et les donnees passe automatiquement par spring
	 * @return string : vers la page afficher
	 * @throws NamingException
	 */
	@RequestMapping("/read")
	public String read(@RequestParam String nom, Model modele)
			throws NamingException {

		Artiste a = (Artiste) manager.get(Ressources.artiste, nom,"view");

		
		modele.addAttribute("artiste", a);
		modele.addAttribute("similaires", a.getListeSimilaire());

		return "artiste/afficher";
	}
	
}

