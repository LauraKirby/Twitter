//
//  TwitterClient.swift
//  Twitter2
//
//  Created by Laura Kirby on 10/15/14.
//  Copyright (c) 2014 LK. All rights reserved.
//

import UIKit

let twitterConsumerKey = "nzXSuskTlfgBD3M1srUKipV2W"
let twitterConsumerSecret = "cEzXLhZOnBTOwALt2PcGckAnpAWeCOjIGT4DLapuC5U9NBglyI"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1RequestOperationManager {
    var loginCompletion: ((user: User?, error: NSError?) -> ())?
   
    class var sharedInstance: TwitterClient {
    struct Static {
        static let instance = TwitterClient(baseURL:twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        return Static.instance
    }
    
    func homeTimelineWithParams(params: NSDictionary?, completion: (tweets: [Tweet]?, error: NSError?) -> ()) {
        
        GET("1.1/statuses/home_timeline.json", parameters: params, success: { (operation:AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            // println("user: \(response)")
            var tweets = Tweet.tweetsWithArray(response as [NSDictionary])
            for tweet in tweets {
                    println("text: \(tweet.text) created:\(tweet.createdAt)")
                }
                completion(tweets: tweets, error: nil)
                }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println("error getting current user")
                completion (tweets: nil, error: error) 
        })
        
    }

    func loginWithCompletion (completion: (user: User?, error: NSError?) -> ()) {
        loginCompletion = completion
        
        //Fetch request token and redirect to authorization page
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath( "oauth/request_token", method: "Get", callbackURL: NSURL (string:"lktwitterdemo://oauth"), scope: nil, success: { (requestToken:BDBOAuthToken!) -> Void in
            println("Got the request token")
            var authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL)
            }) { (error:NSError!) -> Void in
                println("Failed to get token")
                self.loginCompletion?(user:nil, error: error)
        }
    
    }
    
    func openURL(url: NSURL) {
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: BDBOAuthToken(queryString: url.query), success: { (accessToken: BDBOAuthToken!) -> Void in
            println("received access token")
            TwitterClient.sharedInstance.requestSerializer.saveAccessToken(accessToken)
            
            TwitterClient.sharedInstance.GET("1.1/account/verify_credentials.json", parameters: nil, success: { (operation:AFHTTPRequestOperation!, response: AnyObject!) ->
                Void in
                // println("user: \(response)")
                
                var loggedInUser = User(dictionary: response as NSDictionary)
                
                println("user: \(loggedInUser.name)")
                self.loginCompletion?(user:loggedInUser,error:nil)
                User.currentUser = loggedInUser 
                
                }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                    println("error getting current user")
                    self.loginCompletion?(user:nil, error: error)
            })
            

            
            
            }) { (error: NSError!) -> Void in
                println("failed to receive access token")
                self.loginCompletion?(user:nil, error: error)
                
        }

        
    }
    
    
    // TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerKey)
}
