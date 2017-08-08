package com.jdbc.dao;

import com.jdbc.models.UsersEntity;

import java.util.ArrayList;

public interface ParentUserDao {
    public int HIBERNATE_DAO = 1;
    public ArrayList<UsersEntity> userList();
    public void addUser(UsersEntity user);
    public void editUser(UsersEntity user);
    public void deleteUser(UsersEntity user);
    public String getUser(String username, String password);


}
