package com.jdbc.dao;

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


}
