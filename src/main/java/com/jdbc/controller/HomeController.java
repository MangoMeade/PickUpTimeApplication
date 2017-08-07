package com.jdbc.controller;
        import org.springframework.stereotype.Controller;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.servlet.ModelAndView;
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
