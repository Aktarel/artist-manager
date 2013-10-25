package fr.esiea.ail.webprog.webapp.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter  {

	Logger log = Logger.getLogger(UserInterceptor.class);
	
     public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
     throws Exception {
    	  
    	  if(request.isSecure())
    		  log.info("Secured!");
    	  if(request.getSession().isNew()){
    		  log.info("Nouvel utilisateur!");
    		  log.info(request.getRemoteHost());
    	  }
          return super.preHandle(request, response, handler);
     }
}
