package com.jdbc.dao;

import com.jdbc.models.EventsEntity;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.springframework.ui.Model;

import java.sql.Date;
import java.util.ArrayList;

public class HibernateEventDao implements ParentEventDao {
    public ArrayList<EventsEntity> eventList() {

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");


        SessionFactory sessionFact = cfg.buildSessionFactory();

        Session selectEvents = sessionFact.openSession();

        selectEvents.beginTransaction();

        Criteria c = selectEvents.createCriteria(EventsEntity.class);
        //selectEvents.close();

        return (ArrayList<EventsEntity>) c.list();
    }

    public String addEvent(String name, String sport, String address, Date day, String description,
                           int peopleGoing, int minNeeded, String time, double lat, double lng, Model model) {
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
        newEvent.setPeopleGoing(peopleGoing);
        newEvent.setMinNeeded(minNeeded);
        newEvent.setLatitude(lat);
        newEvent.setLongitude(lng);

        session.save(newEvent);
        tx.commit();
        session.close();

        ArrayList<EventsEntity> eventList = eventList();

        model.addAttribute("eventlist", eventList);

        return "redirect:listevents";
    }

    public void updateEvent(int eventID, int peopleGoing) {
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

    }


    public void deleteEvent() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");

        SessionFactory sessionFact = cfg.buildSessionFactory();

        Session selectEvents = sessionFact.openSession();

        selectEvents.beginTransaction();

        Transaction tx = selectEvents.beginTransaction();

        Query query = selectEvents.createQuery("FROM EventsEntity WHERE day < subdate(current_date, 1)");
        
        EventsEntity deletedEvent = (EventsEntity) query.setMaxResults(1).uniqueResult( );


        selectEvents.delete(deletedEvent);

        tx.commit();

        selectEvents.close();
    }

    public EventsEntity getEvent(int eventID) {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");


        SessionFactory sessionFact = cfg.buildSessionFactory();

        Session selectEvents = sessionFact.openSession();

        Transaction tx = selectEvents.beginTransaction();

        Query query = selectEvents.createQuery("FROM EventsEntity WHERE eventId = " + eventID);

        EventsEntity event = (EventsEntity) query.setMaxResults(1).uniqueResult();

        tx.commit();

        selectEvents.close();
        return event;

    }
}
