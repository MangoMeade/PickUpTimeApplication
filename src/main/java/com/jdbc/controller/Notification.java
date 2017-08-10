package com.jdbc.controller;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class Notification {
    // Find your Account Sid and Token at twilio.com/user/account
    public static final String ACCOUNT_SID = "AC2794bc8fc91673912b21a57f6eb41e1c";
    public static final String AUTH_TOKEN = "";

    public static void sendNotification() {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Message message = Message
                .creator(new PhoneNumber("+18104343973"), new PhoneNumber("+16362385638"), "location confirmed")
                .create();

        System.out.println(message.getSid());
    }
}