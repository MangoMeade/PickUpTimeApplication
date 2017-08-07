package com.jdbc.dao;

import com.jdbc.POJO.User;
import com.jdbc.models.UsersEntity;

import java.util.ArrayList;

public interface ParentUserDao {
    public int HIBERNATE_DAO = 1;
    public ArrayList<UsersEntity> userList();
    public void addUser(User user);
    public void editUser(User user);
    public void deleteUser(User user);


}
