package com.jdbc.controller;

import com.jdbc.models.EventsEntity;
import com.jdbc.models.UsersEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.jdbc.dao.DaoEventFactory;
import com.jdbc.dao.DaoUserFactory;
import com.jdbc.dao.ParentEventDao;
import com.jdbc.dao.ParentUserDao;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.ArrayList;

@Controller
public class HomeController {
    private Session getSession() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session selectAll = sessionFact.openSession();
        selectAll.beginTransaction();
        return selectAll;
    }

    @RequestMapping("/")
    public ModelAndView loginPage() {
        return new
                //the type is model and view which brings together model and view
                ModelAndView("login", "loginPage", "Welcome");
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
        session.save(newUsers);
        tx.commit();
        session.close();
        model.addAttribute("NewUsers", newUsers);
        return "addusersuccess";
    }

    private ParentUserDao userDao = DaoUserFactory.getDaoInstance(ParentUserDao.HIBERNATE_DAO);
    private ParentEventDao eventDao = DaoEventFactory.getDaoInstance(ParentEventDao.HIBERNATE_DAO);


    @RequestMapping(value = "/listevents")

    public ModelAndView listEvents() {
        ArrayList<EventsEntity> eventList = eventDao.eventList();

        return new ModelAndView("listEvents", "cList", eventList);
    }

    @RequestMapping(value = "/editevent", method = RequestMethod.GET)

    public ModelAndView editEvent(Model model, @RequestParam("id") int eventID) {
        EventsEntity event = eventDao.getEvent(eventID);

        model.addAttribute("name", event.getName());
        model.addAttribute("sport", event.getSport());
        model.addAttribute("address", event.getAddress());

        ArrayList<EventsEntity> eventList = eventDao.eventList();

        return new ModelAndView("eventToEdit", "cList", eventList);
    }


}
