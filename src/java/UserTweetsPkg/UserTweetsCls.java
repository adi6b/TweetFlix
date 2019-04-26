package UserTweetsPkg;

import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Akshay
 */
public class UserTweetsCls {
    
    private String userName;
    private ArrayList<String> userTweetsList = new ArrayList<String>();
    private String screenName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public ArrayList<String> getUserTweets() {
        return userTweetsList;
    }

    public void setUserTweets(String userTweets) {
        userTweetsList.add(userTweets);
    }

    public String getScreenName() {
        return screenName;
    }

    public void setScreenName(String screenName) {
        this.screenName = screenName;
    }
    
    
    
    
}
