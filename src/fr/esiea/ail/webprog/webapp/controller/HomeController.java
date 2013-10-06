package fr.esiea.ail.webprog.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/accueil/*")
public class HomeController {

	
	@RequestMapping("/welcome")
	public String home(Model modele){
		return "accueil";
	}
	
}
