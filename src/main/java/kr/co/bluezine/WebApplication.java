package kr.co.bluezine;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@SpringBootApplication
@Controller
public class WebApplication extends SpringBootServletInitializer {

	private static final Logger logger = LoggerFactory.getLogger(WebApplication.class);
	
    public static void main(String[] args) {
    	logger.debug("-------------> Web Application Starting...");
        SpringApplication.run(WebApplication.class, args);
    }

    @RequestMapping(value="/", method=RequestMethod.GET)
    public ModelAndView main() {
    	return new ModelAndView("index");
    }
}
