package com.jdbc.dao;

import com.jdbc.models.EventsEntity;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.util.ArrayList;

public class HibernateEventDao implements ParentEventDao {
    private int eventId;

    public ArrayList<EventsEntity> eventList() {

        Configuration cfg = new Configuration( ).configure("hibernate.cfg.xml");


        SessionFactory sessionFact = cfg.buildSessionFactory( );

        Session selectEvents = sessionFact.openSession( );

        selectEvents.beginTransaction( );

        Criteria c = selectEvents.createCriteria(EventsEntity.class);
        //selectEvents.close();

        return (ArrayList<EventsEntity>) c.list( );
    }

    public void addEvent(EventsEntity event) {

    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)

    public String updateEvent(Model model, @RequestParam("id") int eventId, @RequestParam("name") String name,
                              @RequestParam("sport") String sport,
                              @RequestParam("address") String address,
                              @RequestParam("day") Date day,
                              @RequestParam("description") String description,
                              @RequestParam("min") int minNeeded,
                              @RequestParam("time") String time,
                              @RequestParam("lat") double lat,
                              @RequestParam("lng") double lng) {
        this.eventId = eventId; // this.eventid = eventid;
        Configuration cfg = new Configuration( ).configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory( ); // design pattern
        Session session = sessionFact.openSession( );
        session.beginTransaction( );
        EventsEntity editItem = (EventsEntity) session.get(EventsEntity.class, eventId); //eventid
        model.addAttribute("name", name); //peoplegoing
        model.addAttribute("sport", sport);
        model.addAttribute("address", address);
        model.addAttribute("time", time);
        model.addAttribute("day", day);
        model.addAttribute("description", description);
        return "listevents"; // listevents
    }
    public void updateEvent(int eventID, int peopleGoing) {
        Configuration cfg = new Configuration( ).configure("hibernate.cfg.xml");

        SessionFactory sessionFact = cfg.buildSessionFactory( );

        Session session = sessionFact.openSession( );

        session.beginTransaction( );

        EventsEntity updateEvent = (EventsEntity) session.get(EventsEntity.class, eventID);
        model.addAttribute("name", name); //peoplegoing
        model.addAttribute("sport", sport);
        model.addAttribute("address", address);
        model.addAttribute("time", time);
        model.addAttribute("day", day);
        model.addAttribute("description", description);

        updateEvent.setEventId(eventID);
        updateEvent.setPeopleGoing(peopleGoing);

        session.update(updateEvent);

        session.getTransaction( ).commit( );
        session.close( );


    }

    public void deleteEvent() {
        Configuration cfg = new Configuration( ).configure("hibernate.cfg.xml");

        SessionFactory sessionFact = cfg.buildSessionFactory( );

        Session selectEvents = sessionFact.openSession( );

        selectEvents.beginTransaction( );

        Transaction tx = selectEvents.beginTransaction( );

        Query query = selectEvents.createQuery("FROM EventsEntity WHERE day < subdate(current_date, 1)");


        EventsEntity deletedEvent = (EventsEntity) query.setMaxResults(1).uniqueResult( );

        selectEvents.delete(deletedEvent);

        tx.commit( );

        selectEvents.close( );
    }

    public EventsEntity getEvent(int eventID) {
        Configuration cfg = new Configuration( ).configure("hibernate.cfg.xml");


        SessionFactory sessionFact = cfg.buildSessionFactory( );

        Session selectEvents = sessionFact.openSession( );

        Transaction tx = selectEvents.beginTransaction( );

        Query query = selectEvents.createQuery("FROM EventsEntity WHERE eventId = " + eventID);

        EventsEntity event = (EventsEntity) query.setMaxResults(1).uniqueResult( );

        tx.commit( );

        selectEvents.close( );
        return event;

    }
}
