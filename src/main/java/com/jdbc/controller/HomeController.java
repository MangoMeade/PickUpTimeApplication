package com.jdbc.controller;

import com.jdbc.dao.DaoEventFactory;
import com.jdbc.dao.DaoUserFactory;
import com.jdbc.dao.ParentEventDao;
import com.jdbc.dao.ParentUserDao;
import com.jdbc.models.EventsEntity;
import com.jdbc.models.UsersEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
public class HomeController {
    private ParentUserDao userDao = DaoUserFactory.getDaoInstance(ParentUserDao.HIBERNATE_DAO);
    private ParentEventDao eventDao = DaoEventFactory.getDaoInstance(ParentEventDao.HIBERNATE_DAO);

    //this calls the method
    @RequestMapping("/")
    public ModelAndView helloWorld() {
        return new
                //the type is model and view which brings together model and view
                ModelAndView("welcome", "message", "Welcome to GC Coffee");
    }

    @RequestMapping(value = "/listevents")

    public ModelAndView listEvents() {
        ArrayList<EventsEntity> eventList = eventDao.eventList();

        return new ModelAndView("listEvents", "cList", eventList);
    }

    @RequestMapping(value="/editevent", method= RequestMethod.GET)

    public ModelAndView editEvent(Model model, @RequestParam("id") int eventID) {
        EventsEntity event = eventDao.getEvent(eventID);

        model.addAttribute("name", event.getName());
        model.addAttribute("sport", event.getSport());
        model.addAttribute("address", event.getAddress());

        ArrayList<EventsEntity> eventList = eventDao.eventList();

        return new ModelAndView("eventToEdit", "cList", eventList);
    }


}
