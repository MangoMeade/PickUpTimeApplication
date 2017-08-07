package com.jdbc.dao;

import com.jdbc.POJO.Event;
import com.jdbc.models.EventsEntity;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;

import java.util.ArrayList;

public class HibernateEventDao implements ParentEventDao{
    public ArrayList<EventsEntity> eventList() {

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");


        SessionFactory sessionFact = cfg.buildSessionFactory();

        Session selectEvents = sessionFact.openSession();

        selectEvents.beginTransaction();

        Criteria c = selectEvents.createCriteria(EventsEntity.class);

        return (ArrayList<EventsEntity>) c.list();
    }

    public void addEvent(Event event) {

    }

    public void editEvent(Event event) {

    }

    public void deleteEvent(Event event) {

    }

    public EventsEntity getEvent(int eventID) {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");


        SessionFactory sessionFact = cfg.buildSessionFactory();

        Session selectEvents = sessionFact.openSession();

        Transaction tx = selectEvents.beginTransaction();

        Query query = selectEvents.createQuery("FROM EventsEntity WHERE eventId = " +eventID);

        EventsEntity event = (EventsEntity) query.setMaxResults(1).uniqueResult();

        selectEvents.close();
        return event;

    }
}
