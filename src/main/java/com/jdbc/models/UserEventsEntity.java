package com.jdbc.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by michelhayman on 8/15/17.
 */
@Entity
@Table(name = "userEvents", schema = "pickupdb", catalog = "")
public class UserEventsEntity {
    private int userEventscol;

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
}
