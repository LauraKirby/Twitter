//
//  TweetsViewController.swift
//  Twitter2
//
//  Created by Laura Kirby on 10/19/14.
//  Copyright (c) 2014 LK. All rights reserved.
//

import UIKit


class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var tweets: [Tweet]?
    var refreshControl:UIRefreshControl!
   
    @IBOutlet weak var tweetsTableView: UITableView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweets = [Tweet]()
        
        tweetsTableView.delegate = self
        tweetsTableView.dataSource = self
        tweetsTableView.estimatedRowHeight = 150.0
        tweetsTableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.magentaColor()
      
        

        // Do any additional setup after loading the view.
        
//        TwitterClient.sharedInstance.homeTimelineWithParams(nil,  completion: { (tweets, error) -> () in
//            self.tweets = tweets
//            self.tweetsTableView.reloadData()
//            
//            
//        })
        self.loadTimeline()
        
        refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.blueColor()
        refreshControl.tintColor = UIColor.blueColor()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        tweetsTableView.addSubview(refreshControl)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refresh (sender:AnyObject)
    {
        loadTimeline()
    }
    
    func loadTimeline()
    {
        TwitterClient.sharedInstance.homeTimelineWithParams(nil,  completion: { (tweets, error) -> () in
            self.tweets = tweets
            self.tweetsTableView.reloadData()
            
            if (self.refreshControl.refreshing)
            {
                self.refreshControl.endRefreshing()
            }
    
      })
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int{
        
        println("number of tweets: \(tweets!.count)")
        return tweets!.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell = tweetsTableView.dequeueReusableCellWithIdentifier("TweetCell") as TweetCell
        
        var tweet = tweets! [indexPath.row]
        println("setting data for row: \(indexPath.row)")


        cell.setTweet(tweet)

        return cell
    }
    
    @IBOutlet weak var composeTweetButtonPressed: UIBarButtonItem!
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
