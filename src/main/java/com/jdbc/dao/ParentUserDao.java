package com.jdbc.dao;

import com.jdbc.models.UsersEntity;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

public interface ParentUserDao {
    public int HIBERNATE_DAO = 1;
    public ArrayList<UsersEntity> userList();
    public ModelAndView addUser(String firstname, String lastname, String email, String phoneNum, String gender,
                                String username, String password, int age, Model model);
    public void editUser(UsersEntity user);
    public void deleteUser(UsersEntity user);
    public String getUser(String username, String password);


    boolean isValid(String username, String password);
}
