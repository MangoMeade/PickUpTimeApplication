package com.jdbc.controller;

import com.jdbc.dao.DaoUserFactory;
import com.jdbc.dao.ParentUserDao;
import com.jdbc.models.UsersEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

import org.springframework.ui.Model;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
//To limit the use of the page to registered users
//Hibernate reduces the risk of code injection

public class LoginController {
    private ParentUserDao userDao = DaoUserFactory.getDaoInstance(ParentUserDao.HIBERNATE_DAO);


    @RequestMapping("/login")
    public ModelAndView loginPage() {
        return new
                //the type is model and view which brings together model and view
                ModelAndView("login", "loginPage", "login");
    }


    @RequestMapping("/")
    public String welcomePage() {

        return "welcome";
    }



//Displays on the page "login failed"
    @RequestMapping("/loginfailed")
    public ModelAndView loginFailed() {
        String loginFailed = "Login Failed. Try Again";

        return new
                //the type is model and view which brings together model and view
                ModelAndView("login", "loginFailed", loginFailed);
    }

    @RequestMapping(value = "/loggedin", method = RequestMethod.POST)
    public ModelAndView loggedIn(@RequestParam("username") String username, @RequestParam("password") String password, HttpServletResponse response) {
       //if username and password match in the database it will go to list of sports
        boolean isValid = userDao.isValid(username, password);
        String url = "redirect:loginfailed";
        if (isValid) {//has account or authenticated
            //add to session
            //Adds a cookie to keep the user logged in and extracts your information
            Cookie usernameCookie = new Cookie("username", username);
            response.addCookie(usernameCookie);
            url = "redirect:listofsports";
        }
        //else it will redirect you to loginfailed
        return new
                //the type is model and view which brings together model and view
                ModelAndView(url, "", "");
    }

    @RequestMapping(value = "/listusers")

    public ModelAndView listUsers() {
        ArrayList<UsersEntity> userList = userDao.userList();

        return new ModelAndView("/WEB-INF/views/listusers.jsp", "cList", userList);
    }


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


        return userDao.addUser(firstname, lastname, email, phoneNum, gender, username, password, age, model);

    }

}
