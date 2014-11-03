//
//  TweetCell.swift
//  Twitter2
//
//  Created by Laura Kirby on 10/22/14.
//  Copyright (c) 2014 LK. All rights reserved.
//

import UIKit
import QuartzCore

class TweetCell: UITableViewCell {

    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var createdAtTimeAgoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTweet(tweet: Tweet)
    {
  
        
        var user = tweet.user
        
        userNameLabel.text = user?.name
        screenNameLabel.text = "@\((tweet.user?.screenname)!)"
        createdAtTimeAgoLabel.text = tweet.createdAt?.timeAgo()
        tweetTextView.text = tweet.text
        


        var userImageURL = user?.profileImageUrl
        
        userImage.setImageWithURL(NSURL (string: userImageURL!))
        userImage.layer.cornerRadius = 8.0
        userImage.clipsToBounds = true
        
        
        
       
        
        
        //create @username label
        
//        userTagLine.text = user?.tagline
//        println("tagline is: \(user?.tagline)")
        
     //   println("number of tweets: \(tweets!.count)")
        
        //create timestamp
        
        
//        create hyperlink w/i tweet text label
        
//        let range = text?.rangeOfString("http://")
//        
//        if(range != nil)
//        {
//            println(index)
//            let spaceRange = text?.substringFromIndex(range!.startIndex).rangeOfString(" ")
//            if(spaceRange != nil)
//            {
//                let linkRange = Range(range, spaceRange!.startIndex)
//            }
//            else
//            {
//                let linkRange = Range(range, text!.endIndex)
//            }
//        }
//
    }

}
