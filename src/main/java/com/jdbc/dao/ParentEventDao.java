package com.jdbc.dao;

import com.jdbc.models.EventsEntity;

import java.util.ArrayList;

public interface ParentEventDao {
    public int HIBERNATE_DAO = 1;
    public ArrayList<EventsEntity> eventList();
    public void addEvent(EventsEntity event);
    public void updateEvent(int eventID, int peopleGoing);
    public void deleteEvent(EventsEntity event);
    public EventsEntity getEvent(int eventID);
}
