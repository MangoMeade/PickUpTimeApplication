package com.jdbc.dao;

public class DaoEventFactory {
    public static ParentEventDao getDaoInstance(int fileDao) {
        switch (fileDao) {
            case ParentEventDao.HIBERNATE_DAO:
                return new HibernateEventDao();
            default:
                break;
        }
        return null;
    }
}
