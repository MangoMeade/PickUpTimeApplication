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
import java.sql.Date;

@Controller
public class HomeController {


    private Session getSession() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session selectAll = sessionFact.openSession();
        selectAll.beginTransaction();
        return selectAll;

    }

    private ParentUserDao userDao = DaoUserFactory.getDaoInstance(ParentUserDao.HIBERNATE_DAO);
    private ParentEventDao eventDao = DaoEventFactory.getDaoInstance(ParentEventDao.HIBERNATE_DAO);


    @RequestMapping(value = "/listevents")

    public ModelAndView listEvents() {
        ArrayList<EventsEntity> eventList = eventDao.eventList();

        return new ModelAndView("listEvents", "cList", eventList);
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)

    public ModelAndView updateEvent(Model model, @RequestParam("id") int eventId) {

        return new ModelAndView("updateEventForm", "eventId", eventId);
    }

    @RequestMapping("/updateform")

    public ModelAndView updateForm(Model model, @RequestParam("eventId") int eventID, @RequestParam("peopleGoing") int peopleGoing) {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");

        SessionFactory sessionFact = cfg.buildSessionFactory();

        Session session = sessionFact.openSession();

        session.beginTransaction();

        EventsEntity updateEvent = (EventsEntity) session.get(EventsEntity.class, eventID);

        updateEvent.setEventId(eventID);
        updateEvent.setPeopleGoing(peopleGoing);

        session.update(updateEvent);

        session.getTransaction().commit();
        session.close();


        ArrayList<EventsEntity> eventList = eventDao.eventList();

        return new ModelAndView("listEvents", "cList", eventList);
    }


    @RequestMapping("/addNewEvent")
    public String addnewItem(@RequestParam("name") String name,
                             @RequestParam("sport") String sport,
                             @RequestParam("address") String address,
                             @RequestParam("day") Date day,
                             @RequestParam("time") String time, Model model) {

        Configuration cfg = new Configuration( ).configure("hibernate.cfg.xml");

        SessionFactory sessionFact = cfg.buildSessionFactory( ); // design pattern

        Session session = sessionFact.openSession( );

        Transaction tx = session.beginTransaction( );

        EventsEntity newEvent = new EventsEntity( );

        newEvent.setName(name);
        newEvent.setSport(sport);
        newEvent.setAddress(address);
        newEvent.setTime(time);
        newEvent.setDay(day);

        session.save(newEvent);
        tx.commit( );
        session.close( );

        ArrayList<EventsEntity> eventList = eventDao.eventList();

        model.addAttribute("eventlist", eventList);

        return "addeventsuccess";
    }

    @RequestMapping("/addevent")
    // the String method returns the jsp page that we want to show
    public String addevent() {

        return "addevent";
    }




}
