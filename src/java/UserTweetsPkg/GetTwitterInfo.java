	/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Akshay
 */
package UserTweetsPkg;

import twitter4j.*;
import twitter4j.conf.ConfigurationBuilder;
import java.util.ArrayList;
import java.util.HashMap;


public class GetTwitterInfo {
    
        static String twitterUserName="";
        
        

	public static UserTweetsCls[] getUserTweets(String screenName) throws Exception {
            
            twitterUserName = screenName;
    	Twitter twitter;
    	//protected TwitterStream twitterStream;
    	ConfigurationBuilder configBuilder;

//    	HashMap<String, ArrayList<String>> userTweetsList = new HashMap<String, ArrayList<String>>();
        UserTweetsCls[] userTweetCls = null;

    	configBuilder = new ConfigurationBuilder();
    	configBuilder.setDebugEnabled(true);
    	configBuilder.setOAuthConsumerKey("bhifUbUcoDI4LBU1T9RfyUeYF");	//consumer key
    	configBuilder.setOAuthConsumerSecret("nkURyo6aviJZ0AqvAoyR9hE1DWC2jI49fCP5WZbPt8EElAHW2R"); // consumer secret key
    	configBuilder.setOAuthAccessToken("156525734-mgOARflx0ZkFcO5Gd2wjAFw8v0BdqN7JJbzZyQkd");  // Auth Token
    	configBuilder.setOAuthAccessTokenSecret("UiUUb83gVNiSkamIiHfsaIf5X2NN37GjIU2LpSBbyV2Kz"); // secret Auth token

    	//use the ConfigBuilder.build() method and pass the result to the TwitterFactory
    	TwitterFactory tf = new TwitterFactory(configBuilder.build());
 
    	//you can now get authenticated instance of Twitter object.
    	twitter = tf.getInstance();

    	twitter.users();

        
        User user = twitter.showUser(twitterUserName);
        long userId = user.getId();
        

    	long lCursor = -1;
    	IDs friendsIDs = twitter.getFriendsIDs(userId, lCursor);
//    	System.out.println(twitter.showUser(156525734).getName());
//    	System.out.println("==========================");


//    	Query query = new Query("#movie");
//    	query.count(10); //100 is the max allowed
            userTweetCls = new UserTweetsCls[friendsIDs.getIDs().length];
            
                                 for(int i=0 ; i < userTweetCls.length ; i++)
                                 {
                                     userTweetCls[i] = new UserTweetsCls();
                                 }
            
            int friendListCounter = 0;
            NLP.init();
    	do
    	{
        	for (long i : friendsIDs.getIDs())
        	{
//            	System.out.println(twitter.showUser(i).getName());
                    
                   
//                    friendListCounter++;
                    
            	ResponseList<Status> pqr = twitter.getUserTimeline(i);
            	for(int i1=0 ; i1<pqr.size() ; i1++) {
                	if (pqr.get(i1).getText().contains("#movies") || pqr.get(i1).getText().contains("#cinema") || pqr.get(i1).getText().contains("#moviereview")) {
                            userTweetCls[friendListCounter].setUserName(twitter.showUser(i).getName());
                            userTweetCls[friendListCounter].setUserTweets(pqr.get(i1).getText());
                            userTweetCls[friendListCounter].setScreenName(twitter.showUser(i).getScreenName());
                            friendListCounter++;
                                    
                            int senti = NLP.findSentiment(pqr.get(i1).getText());
                            System.out.println(pqr.get(i1).getText()+" "+senti);
                            System.out.println(twitter.showUser(i).getScreenName());
                	}
            	    }
        	}
    	}while(friendsIDs.hasNext());


    	return userTweetCls;
	}
        
        
        public static String getAccountName()
        {
            return twitterUserName;
        }
        
        

//	public static void main(String args[])throws Exception
//	{
//            GetTwitterInfo.getUserTweets();
//
//	}

}


