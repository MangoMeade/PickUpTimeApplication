package com.jdbc.POJO;

public class Event {
    private String name;
    private String sport;
    private String address;
    private double latitude;
    private double longitude;
    private String time;
    private int peopleGoing;

    public Event(){}
    public Event(String name, String sport, String address, double latitutde, double longitude, String time, int peopleGoing) {
        this.name = name;
        this.sport = sport;
        this.address = address;
        this.latitude = latitutde;
        this.longitude = longitude;
        this.time = time;
        this.peopleGoing = peopleGoing;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSport() {
        return sport;
    }

    public void setSport(String sport) {
        this.sport = sport;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getPeopleGoing() {
        return peopleGoing;
    }

    public void setPeopleGoing(int peopleGoing) {
        this.peopleGoing = peopleGoing;
    }
}
