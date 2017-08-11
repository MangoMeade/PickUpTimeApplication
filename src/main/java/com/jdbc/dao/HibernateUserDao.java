package com.jdbc.dao;

import com.jdbc.controller.Utility;
import com.jdbc.models.UsersEntity;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

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
        newUsers.setPassword(Utility.encryptWithMD5(password));
        newUsers.setAge(age);

        Criteria c = session.createCriteria(UsersEntity.class);
        c.add(Restrictions.like("userName", username));
        ArrayList<UsersEntity> userList = (ArrayList<UsersEntity>) c.list();

        String controller = "";
        if (!(userList.isEmpty())) {
            controller = "Username already taken";
            return new ModelAndView("failed","control",controller);
        }
        Criteria d = session.createCriteria(UsersEntity.class);
        d.add(Restrictions.like("email", email));
        ArrayList<UsersEntity> userList2 = (ArrayList<UsersEntity>) d.list();

        if (!(userList2.isEmpty())) {
            controller = "Email already taken";
            return new ModelAndView("failed","control",controller);
        }

        model.addAttribute("firstname", firstname);
        session.save(newUsers);
        tx.commit();
        session.close();
        model.addAttribute("NewUsers", newUsers);
        return new ModelAndView("addusersuccess","","");
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
            if (username.equals(user.getUserName()) && Utility.encryptWithMD5(password).equals(user.getPassword())) {
                return true;
            }

        }
        return false;
    }




}
