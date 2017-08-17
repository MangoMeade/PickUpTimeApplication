package com.jdbc.models;

import javax.persistence.*;

/**
 * Created by michelhayman on 8/15/17.
 */
@Entity
@Table(name = "userEvents", schema = "pickupdb", catalog = "")
public class UserEventsEntity {
    private int userEventscol;
    private String username;
    private int eventId;

    @Id
    @Column(name = "userEventscol", nullable = false)
    public int getUserEventscol() {
        return userEventscol;
    }

    public void setUserEventscol(int userEventscol) {
        this.userEventscol = userEventscol;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserEventsEntity that = (UserEventsEntity) o;

        if (userEventscol != that.userEventscol) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return userEventscol;
    }

    @Basic
    @Column(name = "username", nullable = true)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    @Basic
    @Column(name = "eventID", nullable = true)
    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }
}
