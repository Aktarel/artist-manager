package fr.esiea.ail.webprog.webapp.filter;

import java.util.Date;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






import manager.GestionnaireRessource;
import manager.Ressources;
import modele.Utilisateur;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.support.ManagedArray;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 * Intercepteur appelle a chaque fois qu'un utilisateur passe sur une page de l'application
 * @author nicolas
 *
 */
public class UserInterceptor extends HandlerInterceptorAdapter  {

	private Logger log = Logger.getLogger(UserInterceptor.class);
	
	private InitialContext ic ;
	
	/**
	 * Declaration du contexte pour aller chercher le gestionnaire de ressource et checker l'utilisateur
	 * @throws NamingException
	 */
	public UserInterceptor() throws NamingException {
		Properties env = new Properties();
		env.setProperty("java.naming.factory.initial",
				"org.jnp.interfaces.NamingContextFactory");
		env.setProperty("java.naming.factory.url.pkgs",
				"org.jboss.naming:org.jnp.interfaces");
		env.setProperty("java.naming.provider.url", "jnp://localhost:1099");
		this.ic = new InitialContext(env);
	
	}
	
	
	/**
	 * Execute au demarrage de toute url
	 * Permet de verifier si l'utilisateur est connu de nos services
	 * TODO :Et pouvoir le trace si il choisit plusieurs artistes pour si il vote 
	 * 
	 */
     public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
     throws Exception {

    	 //On check si l'utilisateur a une session chez nous 
    	 //Si oui on l'identifie par son IP
    	 //A voir plus tard pour un systeme d'authentification
    	 GestionnaireRessource manager = (GestionnaireRessource) ic.lookup("Ear01/RessourceManagerImpl/local");
    	  if(request.getSession().isNew()){
    		  manager.add(Ressources.utilisateur, new Utilisateur(request.getRemoteHost(), new Date()));
    	  }
    	  else{
    		  if(request.getAttribute("utilisateur")==null)
    			  request.setAttribute("utilisateur",manager.get(Ressources.utilisateur, request.getRemoteAddr()));
    	  }
    	  
          return super.preHandle(request, response, handler);
     }
}
