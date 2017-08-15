package com.jdbc.dao;

import com.jdbc.models.EventsEntity;
import org.springframework.ui.Model;

import java.sql.Date;
import java.util.ArrayList;

public interface ParentEventDao {
    public int HIBERNATE_DAO = 1;
    //Made changes to eventList method, added parameter
    //Added new method called evenListFiltered
    public ArrayList<EventsEntity> eventListFiltered(String sport);
    public ArrayList<EventsEntity> eventList();
    public String addEvent(String name, String sport, String address, Date day, String description,
                           int peopleGoing, int minNeeded, String time, double lat, double lng, String username, Model model);
    public void updateEvent(int eventID, int peopleGoing);
    public void deleteEvent();
    public EventsEntity getEvent(int eventID);
}
