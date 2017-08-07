package com.jdbc.dao;

import com.jdbc.POJO.Event;
import com.jdbc.POJO.User;
import com.jdbc.models.EventsEntity;
import com.jdbc.models.UsersEntity;

import java.util.ArrayList;
import java.util.List;

public interface ParentUserDao {
    public int HIBERNATE_DAO = 1;
    public ArrayList<UsersEntity> userList();
    public void addUser(User user);
    public void editUser(User user);
    public void deleteUser(User user);


}
