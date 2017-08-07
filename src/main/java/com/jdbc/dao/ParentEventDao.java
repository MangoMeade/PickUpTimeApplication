package com.jdbc.dao;

import com.jdbc.POJO.Event;
import com.jdbc.models.EventsEntity;

import java.util.ArrayList;

public interface ParentEventDao {
    public int HIBERNATE_DAO = 1;
    public ArrayList<EventsEntity> eventList();
    public void addEvent(Event event);
    public void editEvent(Event event);
    public void deleteEvent(Event event);
    public EventsEntity getEvent(int eventID);
}
