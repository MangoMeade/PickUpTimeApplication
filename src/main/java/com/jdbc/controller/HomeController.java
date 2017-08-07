package com.jdbc.controller;
        import com.test.models.UsersEntity;
        import org.hibernate.Criteria;
        import org.hibernate.Session;
        import org.hibernate.SessionFactory;
        import org.hibernate.cfg.Configuration;
        import org.springframework.stereotype.Controller;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.servlet.ModelAndView;

        import java.util.ArrayList;

@Controller
public class HomeController {
    //this calls the method
    @RequestMapping("/")
    public ModelAndView helloWorld()
    {
        return new
                //the type is model and view which brings together model and view
                ModelAndView("welcome","message","Welcome to GC Coffee");
    }

}
