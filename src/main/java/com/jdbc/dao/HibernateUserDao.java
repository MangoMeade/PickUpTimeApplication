package com.jdbc.dao;

import com.jdbc.controller.Utility;
import com.jdbc.models.UsersEntity;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;

import java.util.ArrayList;

public class HibernateUserDao implements ParentUserDao {

    public ArrayList<UsersEntity> userList() {
        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");

        SessionFactory sessionFact = cfg.buildSessionFactory();

        Session selectUsers = sessionFact.openSession();

        selectUsers.beginTransaction();

        Criteria c = selectUsers.createCriteria(UsersEntity.class);

        return (ArrayList<UsersEntity>) c.list();
    }

    public void addUser(UsersEntity user) {

    }

    public void editUser(UsersEntity user) {

    }

    public void deleteUser(UsersEntity user) {

    }

    public String getUser(String username, String password) {
        ArrayList<UsersEntity> users = userList();
        for(UsersEntity user : users) {
            System.out.println(username + " " + password + " " + user);
            if (username.equals(user.getUserName()) && password.equals(user.getPassword())) {
                return "redirect:listevents";
            }

        }
        return "redirect:loginfailed";
//        Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
//
//
//        SessionFactory sessionFact = cfg.buildSessionFactory();
//
//        Session selectUsers = sessionFact.openSession();
//
//        Transaction tx = selectUsers.beginTransaction();
//
//        Query query = selectUsers.createQuery("FROM UsersEntity WHERE userName = " + username + "AND password =" + password);
//
//        UsersEntity event = (UsersEntity) query.setMaxResults(1).uniqueResult();
//
//        selectUsers.close();
//
//        if (event.equals(null)) {
//            return "redirect:loginfailed";
//        }
//        return "redirect:listevents";


    }

    public boolean isValid(String username, String password) {
        ArrayList<UsersEntity> users = userList();
        for(UsersEntity user : users) {
            System.out.println(username + " " + password + " " + user);
            if (username.equals(user.getUserName()) && password.equals(user.getPassword())) {
                return true;
            }

        }
        return false;
    }




}
