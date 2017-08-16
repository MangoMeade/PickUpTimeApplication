package com.jdbc.models;

import javax.persistence.*;

/**
 * Created by michelhayman on 8/15/17.
 */
@Entity
@Table(name = "userEvents", schema = "pickupdb", catalog = "")
public class UserEventsEntity {
    private int userEventscol;
    private Integer userId;
    private Integer eventId;

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
        if (o == null || getClass( ) != o.getClass( )) return false;

        UserEventsEntity that = (UserEventsEntity) o;

        if (userEventscol != that.userEventscol) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return userEventscol;
    }

    @Basic
    @Column(name = "userID", nullable = true)
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "eventID", nullable = true)
    public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
    }
}
