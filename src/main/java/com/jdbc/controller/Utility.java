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

    public static String encryptWithMD5(String password) {
        try {
            md = MessageDigest.getInstance("MD5");

            byte[] passBytes = password.getBytes();
            md.reset();
            byte[] digested = md.digest(passBytes);
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


