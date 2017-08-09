package com.jdbc.controller;

import com.jdbc.dao.DaoUserFactory;
import com.jdbc.dao.ParentUserDao;
import com.jdbc.models.UsersEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;


@Controller

public class LoginController {
    private ParentUserDao userDao = DaoUserFactory.getDaoInstance(ParentUserDao.HIBERNATE_DAO);
    @RequestMapping("/")
    public ModelAndView loginPage(/*@RequestParam("password") String password, Model model*/) {

//        model.addAttribute("")

        return new
                //the type is model and view which brings together model and view
                ModelAndView("login", "loginPage", "login");
    }

    @RequestMapping("/loginfailed")
    public ModelAndView loginFailed() {
        String loginFailed = "Login Failed. Try Again";

        return new
                //the type is model and view which brings together model and view
                ModelAndView("login", "loginFailed", loginFailed);
    }

    @RequestMapping("/loggedin")
    public ModelAndView loggedIn(@RequestParam("username") String username, @RequestParam("password") String password) {

        return new
                //the type is model and view which brings together model and view
                ModelAndView(userDao.getUser(username, password), "", "");
    }

    @RequestMapping(value = "/listusers")

    public ModelAndView listUsers() {
        ArrayList<UsersEntity> userList = userDao.userList();

        return new ModelAndView("/WEB-INF/views/listusers.jsp", "cList", userList);
    }

//    @RequestMapping("/listevents1")
//    public String function(Model model, @RequestParam("username") String username,
//                           @RequestParam("password") String password) {
//
//        model.addAttribute("username", username);
//        model.addAttribute("password", password);
//
//        return "listEvents1";
//    }

    @RequestMapping("/getnewuser")

    public String newCustomer() {

        return "adduserform";

    }

    @RequestMapping("/addusersuccess")
    public ModelAndView addNewUser(@RequestParam("firstName") String firstname,
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
        newUsers.setPassword(/*Utility.encryptWithMD5*/(password));
        newUsers.setAge(age);

        Criteria c = session.createCriteria(UsersEntity.class);
        c.add(Restrictions.like("userName", username));
        ArrayList<UsersEntity> userList = (ArrayList<UsersEntity>) c.list();

        String controller = "";
        if (!(userList.isEmpty())) {
            controller = "Username already taken";
            return new ModelAndView("failed","control",controller);
        }
        Criteria d = session.createCriteria(UsersEntity.class);
        d.add(Restrictions.like("email", email));
        ArrayList<UsersEntity> userList2 = (ArrayList<UsersEntity>) d.list();

        if (!(userList2.isEmpty())) {
           controller = "Email already taken";
            return new ModelAndView("failed","control",controller);
        }

        model.addAttribute("firstname", firstname);
        session.save(newUsers);
        tx.commit();
        session.close();
        model.addAttribute("NewUsers", newUsers);
        return new ModelAndView("addusersuccess","","");
    }
}
