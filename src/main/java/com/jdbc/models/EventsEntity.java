package com.jdbc.models;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "events", schema = "pickupdb", catalog = "")
public class EventsEntity {
    private String name;
    private String sport;
    private String address;
    private Double latitude;
    private Double longitude;
    private String time;
    private Integer peopleGoing;
    private int eventId;
    private Date day;

    @Basic
    @Column(name = "name", nullable = true, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "sport", nullable = true, length = 255)
    public String getSport() {
        return sport;
    }

    public void setSport(String sport) {
        this.sport = sport;
    }

    @Basic
    @Column(name = "address", nullable = true, length = 255)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "latitude", nullable = true, precision = 0)
    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    @Basic
    @Column(name = "longitude", nullable = true, precision = 0)
    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    @Basic
    @Column(name = "time", nullable = true, length = 255)
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Basic
    @Column(name = "peopleGoing", nullable = true)
    public Integer getPeopleGoing() {
        return peopleGoing;
    }

    public void setPeopleGoing(Integer peopleGoing) {
        this.peopleGoing = peopleGoing;
    }

    @Id
    @Column(name = "eventID", nullable = false)
    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    @Basic
    @Column(name = "day", nullable = true)
    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EventsEntity that = (EventsEntity) o;

        if (eventId != that.eventId) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (sport != null ? !sport.equals(that.sport) : that.sport != null) return false;
        if (address != null ? !address.equals(that.address) : that.address != null) return false;
        if (latitude != null ? !latitude.equals(that.latitude) : that.latitude != null) return false;
        if (longitude != null ? !longitude.equals(that.longitude) : that.longitude != null) return false;
        if (time != null ? !time.equals(that.time) : that.time != null) return false;
        if (peopleGoing != null ? !peopleGoing.equals(that.peopleGoing) : that.peopleGoing != null) return false;
        if (day != null ? !day.equals(that.day) : that.day != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = name != null ? name.hashCode() : 0;
        result = 31 * result + (sport != null ? sport.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (latitude != null ? latitude.hashCode() : 0);
        result = 31 * result + (longitude != null ? longitude.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        result = 31 * result + (peopleGoing != null ? peopleGoing.hashCode() : 0);
        result = 31 * result + eventId;
        result = 31 * result + (day != null ? day.hashCode() : 0);
        return result;
    }
}
