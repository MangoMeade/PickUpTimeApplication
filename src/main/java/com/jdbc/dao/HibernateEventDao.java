package com.jdbc.dao;

import com.jdbc.models.EventsEntity;
import com.jdbc.models.UserEventsEntity;
import com.jdbc.models.UsersEntity;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.ui.Model;

import java.sql.Date;
import java.util.ArrayList;

public class HibernateEventDao implements ParentEventDao {
    //made changes to this method. added method and a c.list
    //renamed it eventListFiltered
    public ArrayList<EventsEntity> eventListFiltered(String sport) {
        //An instance of Configuration allows the application to specify properties and mapping
        // documents to be used when creating a SessionFactory. Usually an application will
        // create a single Configuration, build a single instance of SessionFactory and then
        // instantiate Sessions in threads servicing client requests.
        // The Configuration is meant only as an initialization-time object.
        // SessionFactorys are immutable and do not retain any association back to the
        // Configuration

        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        //A Session is used to get a physical connection with a database. The Session
        // object is lightweight and designed to be instantiated each time an interaction is
        // needed with the database. Persistent objects are saved and retrieved through a Session
        // object.
        SessionFactory sessionFact = cfg.buildSessionFactory();
        //The lifecycle of a Session is bounded by the beginning and end of a logical transaction.
        // (Long transactions might span several database transactions.)
        //The main function of the Session is to offer create, read and delete
        // operations for instances of mapped entity classes
        Session selectEvents = sessionFact.openSession();
        //It begins a transaction, a transaction is a atomic unit of work
        // which should succeed or fail entirely.
        selectEvents.beginTransaction();
        //The Hibernate Session interface provides createCriteria() method which can be used to create
        // a Criteria object that returns instances of the persistence object's class when your
        // application executes a criteria query.
        Criteria c = selectEvents.createCriteria(EventsEntity.class);
        //selectEvents.close();
        c.add(Restrictions.like("sport", "%" + sport + "%"));
        ArrayList<EventsEntity> eventsEntityArrayList = (ArrayList<EventsEntity>) c.list();
        return (ArrayList<EventsEntity>) c.list();
    }
    public ArrayList<EventsEntity> eventList() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session selectEvents = sessionFact.openSession();
        selectEvents.beginTransaction();
        Criteria c = selectEvents.createCriteria(EventsEntity.class);
        ArrayList<EventsEntity> eventsEntityArrayList = (ArrayList<EventsEntity>) c.list();
        return (ArrayList<EventsEntity>) c.list();
    }
    public String addEvent(String name, String sport, String address, Date day, String description,
                           int peopleGoing, int minNeeded, String time, double lat, double lng, String username, Model model) {
        //This allows us to use hibernate, gives us access to session factory, and hibernate connnects us
        //to our database and it's more secure.
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        //SessionFactory actually creates the session
        SessionFactory sessionFact = cfg.buildSessionFactory(); // design pattern
        //This is when the session begins
        Session session = sessionFact.openSession();
        //actual transfering of data to our database
        Transaction tx = session.beginTransaction();
        //object of eventsentity
        EventsEntity newEvent = new EventsEntity();
        //This gets the userID which allows us to know who added what event
        //It loops through a list of users and checks if their username matches
        int foreignKey = 0;
        ParentUserDao userDao = DaoUserFactory.getDaoInstance(ParentUserDao.HIBERNATE_DAO);
        ArrayList<UsersEntity> users = userDao.userList();
        //USERNAME IS A COOKIE
        //This is so we know who created what event
        for (UsersEntity user: users) {
            if (user.getUserName().equalsIgnoreCase(username)){
                foreignKey = user.getUserId();
            }
        }

        newEvent.setUserId(foreignKey);


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

        //saving the event is just holding the data until it is commited
        session.save(newEvent);
        //this commits the data to the database
        tx.commit();
        //You have to close the sessions because you have several connections running, making it harder to connect to the database
        session.close();
        //sport parameter in eventlist
        ArrayList<EventsEntity> eventList = eventList();
        //add attribute gives you an object of that data so you can display this information on a jsp.

        model.addAttribute("eventlist", eventList);

        return "redirect:listevents";
    }

    public void updateEvent(int eventID, int peopleGoing) {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");

        SessionFactory sessionFact = cfg.buildSessionFactory();

        Session session = sessionFact.openSession();

        session.beginTransaction();
//The session.get method always hit the database and return the real object,
// an object that represent the database row. In this case, it gets eventID
        EventsEntity updateEvent = (EventsEntity) session.get(EventsEntity.class, eventID);
        //Setting the eventID
        updateEvent.setEventId(eventID);
        //Setting the peopleGoing to
        updateEvent.setPeopleGoing(peopleGoing);
        //Update the persistent instance with the identifier of the given detached instance.
        session.update(updateEvent);
        //Commits everything to the database
        session.getTransaction().commit();
        //ends session
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
