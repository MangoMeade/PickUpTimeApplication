package com.jdbc.dao;

import com.jdbc.controller.Utility;
import com.jdbc.models.UsersEntity;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import java.util.ArrayList;

public class HibernateUserDao implements ParentUserDao {

    public ArrayList<UsersEntity> userList() {
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

        Session selectUsers = sessionFact.openSession();
        //It begins a transaction, a transaction is a atomic unit of work
        // which should succeed or fail entirely.

        selectUsers.beginTransaction();
        //The Hibernate Session interface provides createCriteria() method which can be used to create
        // a Criteria object that returns instances of the persistence object's class when your
        // application executes a criteria query.
        Criteria c = selectUsers.createCriteria(UsersEntity.class);

        return (ArrayList<UsersEntity>) c.list();
    }

    public ModelAndView addUser(String firstname, String lastname, String email, String phoneNum, String gender,
                                String username, String password, int age, Model model) {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        SessionFactory sessionFact = cfg.buildSessionFactory();
        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();
        UsersEntity newUsers = new UsersEntity();
        newUsers.setFirstName(firstname);
        newUsers.setLastName(lastname);
        newUsers.setEmail(email);
        newUsers.setPhoneNumber(phoneNum);
        newUsers.setGender(gender);
        newUsers.setUserName(username);
        //encrypts the password
        newUsers.setPassword(Utility.encryptWithMD5(password));
        newUsers.setAge(age);

        Criteria c = session.createCriteria(UsersEntity.class);
        c.add(Restrictions.like("userName", username));
        ArrayList<UsersEntity> userList = (ArrayList<UsersEntity>) c.list();

        String controller = "";
        if (!(userList.isEmpty())) {
            controller = "Username already taken";
            return new ModelAndView("failed", "control", controller);
        }
        Criteria d = session.createCriteria(UsersEntity.class);
        d.add(Restrictions.like("email", email));
        ArrayList<UsersEntity> userList2 = (ArrayList<UsersEntity>) d.list();

        if (!(userList2.isEmpty())) {
            controller = "Email already taken";
            return new ModelAndView("failed", "control", controller);
        }
        //To say hello (firstname) when they are successfully signed up
        model.addAttribute("firstname", firstname);
        //saves and commits new users to database
        session.save(newUsers);
        tx.commit();
        session.close();
        model.addAttribute("NewUsers", newUsers);
        return new ModelAndView("addusersuccess", "", "");
    }

    public void editUser(UsersEntity user) {

    }

    public void deleteUser(UsersEntity user) {

    }

    //May delete later
    public String getUser(String username, String password) {
        ArrayList<UsersEntity> users = userList();
        for (UsersEntity user : users) {
            System.out.println(username + " " + password + " " + user);
            if (username.equals(user.getUserName()) && password.equals(user.getPassword())) {
                return "redirect:listevents";
            }

        }
        return "redirect:loginfailed";
    }

    //password encryption
    public boolean isValid(String username, String password) {
        //passwords are encrypted when signing up and logging in, this is to match the two.
        ArrayList<UsersEntity> users = userList();
        for (UsersEntity user : users) {
            System.out.println(username + " " + password + " " + user);
            if (username.equals(user.getUserName()) && Utility.encryptWithMD5(password).equals(user.getPassword())) {
                return true;
            }
        }
        return false;
    }


}
