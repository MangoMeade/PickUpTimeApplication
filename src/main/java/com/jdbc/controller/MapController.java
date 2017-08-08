package com.jdbc.controller;

import com.jdbc.models.EventsEntity;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

/**
 * Created by Nathan Saleniuc on 8/8/2017.
 */
@Controller
public class MapController {

    @RequestMapping("/map")
    public String map(Model model) {
        ArrayList<EventsEntity> eventList = getAddress();

        model.addAttribute("eventList", eventList);

        return "map";
    }

    private ArrayList<EventsEntity> getAddress() {
        Session selectAddress = getSession();


        // Criteria is used to create the query
        Criteria c = selectAddress.createCriteria(EventsEntity.class);

        // results are returned as list and cast to an ArrayList
        return (ArrayList<EventsEntity>) c.list();
    }
    private Session getSession() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");

        SessionFactory sessionFactory = cfg.buildSessionFactory();

        Session selectAll = sessionFactory.openSession();

        selectAll.beginTransaction();
        return selectAll;
    }





}
