package com.jdbc.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by Nathan Saleniuc on 8/9/2017.
 */
public class Utility {

    private static MessageDigest md;
//gets the password
    public static String encryptWithMD5(String password) {
        try {
            //used to hash to password, converting it to random characters
            md = MessageDigest.getInstance("MD5");
            //converting the string to bytes and storing it in an array
            byte[] passBytes = password.getBytes();
            //deletes previous settings/encryption
            md.reset();
            //where it converts the bytes
            byte[] digested = md.digest(passBytes);
            //String that can be mutilated
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < digested.length; i++) {
                sb.append(Integer.toHexString(0xff & digested[i]));

            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            Logger.getLogger(Utility.class.getName()).log(Level.SEVERE, null, e);        }
        return null;
    }
}


