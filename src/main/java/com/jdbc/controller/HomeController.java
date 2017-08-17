package com.jdbc.controller;

import com.google.gson.Gson;
import com.jdbc.models.EventsEntity;
import com.jdbc.models.UserEventsEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.jdbc.dao.DaoEventFactory;
import com.jdbc.dao.DaoUserFactory;
import com.jdbc.dao.ParentEventDao;
import com.jdbc.dao.ParentUserDao;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import java.util.ArrayList;
import java.sql.Date;


@Controller
@SessionAttributes("loggedinuser")
public class HomeController {


    //Creates a ParentUserDao object called userDao. Calls the getDaoInstance method from the
    //DaoUserFacory class, takes in an int as its parameter, aka the Hibernate_DAO.
    //This calls the getDaoInstance method in the DaoUserFactory which gives us access to HibernateEventDao
    private ParentUserDao userDao = DaoUserFactory.getDaoInstance(ParentUserDao.HIBERNATE_DAO);

    private ParentEventDao eventDao = DaoEventFactory.getDaoInstance(ParentEventDao.HIBERNATE_DAO);


    @RequestMapping(value = "/listeventsfiltered")

    public ModelAndView listEventsFiltered(@RequestParam("sport") String sport) {

        //Array of EventsEntity objects, calling a method from the eventdao which was then implemented in
        //HibernateEventDao, which creates an array list that holds the list of events by sport
        ArrayList<EventsEntity> eventList = eventDao.eventListFiltered(sport);
        //This is basically an array list of events filtered by sport. What ever sport the user
        //enters will be the sport in the array.
        return new ModelAndView("listeventsfiltered", "cList", eventList);
    }

    //Returns the /data class which contains a json controller object.
    //JSON, or JavaScript Object Notation, is a minimal, readable format
    // for structuring data. It is used primarily to transmit data between
    // a server and web application, as an alternative to XML.
    @RequestMapping(value = "/data")
    public ModelAndView data() {
        ArrayList<EventsEntity> eventList = eventDao.eventList();
        //This is converting the event list to Json so that the data can be
        //passed to the google api
        String jsonArray = new Gson().toJson(eventList);
        //Google method?
        //System.out.println(jsonArray);

        return new ModelAndView("data", "json", jsonArray);
    }

    //Returns allmarkers jsp
    //Returns the map with all the pins, this will eventually be implemented into list events
    @RequestMapping(value = "/allmarkers")
    public String allMarkers() {
        return "allmarkers";
    }

    //Lists the events by showing the listevents page. Not filtered.
    @RequestMapping(value = "/listevents") //controller
    //original list with no filters
    public ModelAndView listEvents() {
        //Explain the structure of this array list
        //calls the eventList method from HibernateEventDao
        ArrayList<EventsEntity> eventList = eventDao.eventList();

        return new ModelAndView("listevents", "cList", eventList);
    } // clist is the object you use to display the list

    //The GET method means retrieve whatever information (in the form of an entity) is
    // identified by the Request-URI, the POST method allows users to insert data
    //This method shows the information about the event the user clicks on the screen
    //and allows them to go to the event themself, this will increment people going
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public ModelAndView updateEvent(Model model, @RequestParam("id") int eventId, @RequestParam("peopleGoing") int peopleGoing,
                                    @RequestParam("latitude") double latitude, @RequestParam("longitude") double longitude, @RequestParam("name") String name,
                                    @RequestParam("sport") String sport, @RequestParam("address") String address,
                                    @RequestParam("description") String description, @RequestParam("time") String time, HttpServletRequest request) {
        //This is to get the userID from the login
        //This is used to determine if someone is logged in.
        String username = "";
        Cookie[] cookies = request.getCookies();

        username = checkCookie(username, cookies);
        //if theres no one logged in it will redirect you to the login page
        if (username != "") {
            eventDao.addUserEvent(eventId, username);
            model.addAttribute("eventId", eventId);
            model.addAttribute("peopleGoing", peopleGoing);
            model.addAttribute("latitude", latitude);
            model.addAttribute("longitude", longitude);
            model.addAttribute("name", name);
            model.addAttribute("sport", sport);
            model.addAttribute("address", address);
            model.addAttribute("description", description);
            model.addAttribute("time", time);

            return new ModelAndView("updateeventform", "", "");
        }
        String loginFailed = "Log in to see this webpage";
        return new ModelAndView("login", "loginFailed", loginFailed);

    }

    //This sends on the notification if the number of people is equal to the amount needed
    @RequestMapping("/updateform")
    public ModelAndView updateForm(Model model, @RequestParam("eventId") int eventID, @RequestParam("peopleGoing") int peopleGoing) {
        //Calls the updateEvent method from the HibernateEventDay class
        //it requires two parameters
        //sets the eventID and the people going
        //adds the people going to that specific event
        eventDao.updateEvent(eventID, peopleGoing);

        //gets event based on eventID
        EventsEntity editEvent = eventDao.getEvent(eventID);
        System.out.println(editEvent.getName());
        if (peopleGoing == editEvent.getMinNeeded() || peopleGoing > editEvent.getMinNeeded()) {

            Notification.sendNotification();
        }
        //added request param and sport argument
        //QUESTION: Why is this here?
        //ArrayList<EventsEntity> eventList = eventDao.eventList();


        return new ModelAndView("redirect:confirmation", "", "");
    }


    @RequestMapping("/addeventsuccess")
    public String addnewItem(@RequestParam("name") String name,
                             @RequestParam("sport") String sport,
                             @RequestParam("address") String address,
                             @RequestParam("day") Date day,
                             @RequestParam("description") String description,
                             @RequestParam("peopleGoing") int peopleGoing,
                             @RequestParam("min") int minNeeded,
                             @RequestParam("time") String time,
                             @RequestParam("lat") double lat,
                             @RequestParam("lng") double lng,
                             HttpServletRequest request // used to gets the cookie
            ,
                             Model model) {

        //get cookie statements(the first three) don't forget to pass the parameter(HTTPServletRequest request)
        //This empties the cookie
        String usernameCookie = "";
        //stores all the cookies, gotten by the getmethod
        Cookie[] cookies = request.getCookies();

        usernameCookie = checkCookie(usernameCookie, cookies);
        if (usernameCookie != "") {
            return eventDao.addEvent(name, sport, address, day, description, peopleGoing, minNeeded, time, lat, lng, usernameCookie, model);
        }
        return "login";
    }

    // Returns list of sports
    @RequestMapping("/listofsports")
    public ModelAndView listOfSports() {

        return new ModelAndView("listofsports", "sportlist", "SPORTS");

    }

    //returns addevent
    @RequestMapping("/addevent")
    // the String method returns the jsp page that we want to show
    public String addevent(HttpServletRequest request) {
        String usernameCookie = "";
        //stores all the cookies, gotten by the getmethod
        Cookie[] cookies = request.getCookies();

        usernameCookie = checkCookie(usernameCookie, cookies);
        if (usernameCookie != "") {
            return "addevent";
        }
        return "login";
    }

    //calls the deleteEvent method and directs you to the login page
    @RequestMapping("deleteevents")
    public String deleteEvent() {

        eventDao.deleteEvent();


        return "login";
    }

    //not finished method
    @RequestMapping("attendees")
    public ModelAndView attendees(@RequestParam("id") Integer eventID) {

        ArrayList<UserEventsEntity> userEventList = eventDao.userEventListFiltered(eventID);
        //ArrayList<UserEventsEntity> userEventList = eventDao.userEventList();

        return new ModelAndView("attendees", "cList", userEventList);
    }

    //returns confirmation page
    @RequestMapping("/confirmation")
    public String confirmation() {
        return "confirmation";
    }

    //will log you out
    //QUESTION: Explain
    @RequestMapping("/logout")
    public ModelAndView logOut(HttpServletResponse response) {
        Cookie userCookie = new Cookie("username", "");
        userCookie.setMaxAge(0);
        response.addCookie(userCookie);

        return new ModelAndView("logout", "", "");
    }

    //Checks the list of cookies, gets the name and checks if it's equal to the username. If it is,
    // username will be set equal to cookie.getValue then return username
    //Getting username, and the stored cookies and checking through the list to see if
    //they're equal. Sets username equal to the value of the cookie
    private String checkCookie(String username, Cookie[] cookies) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equalsIgnoreCase("username")) {
                username = cookie.getValue();
            }
        }
        return username;
    }
}
