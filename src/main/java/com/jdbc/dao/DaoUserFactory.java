package com.jdbc.dao;

public class DaoUserFactory {
    public static ParentUserDao getDaoInstance(int fileDao) {
        switch (fileDao) {
            case ParentUserDao.HIBERNATE_DAO:
                return new HibernateUserDao();
            default:
                break;
        }
        return null;
    }
}
