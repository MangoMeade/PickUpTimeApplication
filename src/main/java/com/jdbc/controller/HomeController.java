package com.jdbc.controller;

import com.jdbc.models.EventsEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.jdbc.dao.DaoEventFactory;
import com.jdbc.dao.DaoUserFactory;
import com.jdbc.dao.ParentEventDao;
import com.jdbc.dao.ParentUserDao;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.sql.Date;


@Controller
@SessionAttributes("loggedinuser")
public class HomeController {


    private Session getSession() {
        Configuration cfg = new Configuration( ).configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory( );
        Session selectAll = sessionFact.openSession( );
        selectAll.beginTransaction( );
        selectAll.close( );
        return selectAll;

    }

    private ParentUserDao userDao = DaoUserFactory.getDaoInstance(ParentUserDao.HIBERNATE_DAO);
    private ParentEventDao eventDao = DaoEventFactory.getDaoInstance(ParentEventDao.HIBERNATE_DAO);


    @RequestMapping(value = "/signup")
    public String signup() {

        return "adduserform";

    }

    @RequestMapping(value = "/listevents")

    public ModelAndView listEvents() {
        ArrayList<EventsEntity> eventList = eventDao.eventList( );

        return new ModelAndView("listevents", "cList", eventList);
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public ModelAndView updateEvent(Model model, @RequestParam("id") int eventId, @RequestParam("peopleGoing") int peopleGoing,
                                    @RequestParam("latitude") double latitude, @RequestParam("longitude") double longitude) {

        EventsEntity editEvent = eventDao.getEvent(eventId);
        System.out.println(peopleGoing);
        model.addAttribute("eventId", eventId);
        model.addAttribute("peopleGoing", peopleGoing);
        model.addAttribute("latitude", latitude);
        model.addAttribute("longitude", longitude);


        return new ModelAndView("updateeventform", "", "");
    }

    @RequestMapping("/updateform")

    public ModelAndView updateForm(Model model, @RequestParam("eventId") int eventID, @RequestParam("peopleGoing") int peopleGoing) {

        eventDao.updateEvent(eventID, peopleGoing);


        EventsEntity editEvent = eventDao.getEvent(eventID);
        System.out.println(editEvent.getName());
        if (peopleGoing == editEvent.getMinNeeded() || peopleGoing > editEvent.getMinNeeded()) {
            System.out.println("It worked!");
        }
        ArrayList<EventsEntity> eventList = eventDao.eventList();


        return new ModelAndView("redirect:listevents", "cList", eventList);
    }


    @RequestMapping("/addeventsuccess")
    public String addnewItem(@RequestParam("name") String name,
                             @RequestParam("sport") String sport,
                             @RequestParam("address") String address,
                             @RequestParam("day") Date day,
                             @RequestParam("description") String description,
                             @RequestParam("min") int minNeeded,
                             @RequestParam("time") String time,
                             @RequestParam("lat") double lat,
                             @RequestParam("lng") double lng,
                             Model model) {

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");

        SessionFactory sessionFact = cfg.buildSessionFactory(); // design pattern

        Session session = sessionFact.openSession();

        Transaction tx = session.beginTransaction();

        EventsEntity newEvent = new EventsEntity();

        newEvent.setName(name);
        newEvent.setSport(sport);
        newEvent.setAddress(address);
        newEvent.setTime(time);
        newEvent.setDay(day);
        newEvent.setDescription(description);
        newEvent.setMinNeeded(minNeeded);
        newEvent.setLatitude(lat);
        newEvent.setLongitude(lng);

        session.save(newEvent);
        tx.commit();
        session.close();

        ArrayList<EventsEntity> eventList = eventDao.eventList( );

        model.addAttribute("eventlist", eventList);

        return "redirect:listevents";
    }

    @RequestMapping("/listofsports")
    public ModelAndView listOfSports() {
        return new ModelAndView("listofsports", "sportlist", "SPORTS");
    }

    @RequestMapping("/addevent")
    // the String method returns the jsp page that we want to show
    public String addevent() {

        return "addevent";
    }

    @RequestMapping("deleteevents")
    public String deleteEvent() {

        eventDao.deleteEvent( );


        return "login";
    }


}
