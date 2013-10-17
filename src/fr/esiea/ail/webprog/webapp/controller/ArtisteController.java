package fr.esiea.ail.webprog.webapp.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/artiste")
public class ArtisteController {

	private InitialContext ic;

	public ArtisteController() throws NamingException {

		Properties env = new Properties();
		env.setProperty("java.naming.factory.initial",
				"org.jnp.interfaces.NamingContextFactory");
		env.setProperty("java.naming.factory.url.pkgs",
				"org.jboss.naming:org.jnp.interfaces");
		env.setProperty("java.naming.provider.url", "jnp://localhost:1099");
		InitialContext ic = new InitialContext(env);
		this.ic = ic;
	}

	@RequestMapping("/read")
	public String home(@RequestParam String nom, Model modele)
			throws NamingException {

		List<Artiste> similaires = new ArrayList<Artiste>();

		GestionnaireRessource manager = (GestionnaireRessource) ic
				.lookup("Ear01/ArtisteManagerImpl/remote");
		Artiste a = (Artiste) manager.get(Ressources.artiste, nom);

		if (a != null) {
			for (String similaire : a.getSimilaires().split(" , ")) {
				Artiste artisteToSee = (Artiste) manager.get(
						Ressources.artiste, similaire.trim());
				similaires.add(artisteToSee);
			}
		}
		else
			return "accueil";
		

		modele.addAttribute("artiste", a);
		modele.addAttribute("similaires", similaires);

		return "artiste/afficher";
	}
}
