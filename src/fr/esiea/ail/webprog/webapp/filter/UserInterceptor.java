package fr.esiea.ail.webprog.webapp.filter;

import java.util.Properties;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import manager.GestionnaireRessource;
import manager.Ressources;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter  {


	
	
	private Logger log = Logger.getLogger(UserInterceptor.class);
	
	private InitialContext ic ;
	
	public UserInterceptor() throws NamingException {
		Properties env = new Properties();
		env.setProperty("java.naming.factory.initial",
				"org.jnp.interfaces.NamingContextFactory");
		env.setProperty("java.naming.factory.url.pkgs",
				"org.jboss.naming:org.jnp.interfaces");
		env.setProperty("java.naming.provider.url", "jnp://localhost:1099");
		this.ic = new InitialContext(env);
	
	}
	
     public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
     throws Exception {
    	 
    	  if(request.getSession().isNew()){
    		  GestionnaireRessource manager = (GestionnaireRessource) ic.lookup("Ear01/RessourceManagerImpl/local");
    		  log.info("Nouvel utilisateur : "+request.getRemoteHost());
    		  manager.get(Ressources.utilisateur, request.getRemoteHost());
    	  }
          return super.preHandle(request, response, handler);
     }
}
