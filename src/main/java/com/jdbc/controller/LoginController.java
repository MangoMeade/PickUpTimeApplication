package com.jdbc.controller;

import com.jdbc.models.UsersEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class LoginController {
    @RequestMapping("/")
    public ModelAndView loginPage() {
        return new
                //the type is model and view which brings together model and view
                ModelAndView("login", "loginPage", "login");
    }

    @RequestMapping("/seeEvents")
    public String function(Model model, @RequestParam("username") String username,
                           @RequestParam("password") String password) {

        model.addAttribute("username", username);
        model.addAttribute("password", password);

        return "seeEvents";
    }

    @RequestMapping("/getNewUser")

    public String newCustomer() {

        return "adduserform";

    }

    @RequestMapping("/addusersuccess")

    public String addNewUser(@RequestParam("firstName") String firstname,
                             @RequestParam("lastName") String lastname,
                             @RequestParam("email") String email,
                             @RequestParam("phoneNumber") String phoneNum,
                             @RequestParam("gender") String gender,
                             @RequestParam("userName") String username,
                             @RequestParam("password") String password,
                             @RequestParam("age") int age,
                             Model model) {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();
        UsersEntity newUsers = new UsersEntity();
        newUsers.setFirstName(firstname);
        newUsers.setLastName(lastname);
        newUsers.setEmail(email);
        newUsers.setPhoneNumber(phoneNum);
        newUsers.setGender(gender);
        newUsers.setUserName(username);
        newUsers.setPassword(password);
        newUsers.setAge(age);
        session.save(newUsers);
        tx.commit();
        session.close();
        model.addAttribute("NewUsers", newUsers);
        return "addusersuccess";
    }
}
