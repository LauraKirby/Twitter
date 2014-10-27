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

    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    
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
        

        //create tweet text label
        
        tweetTextLabel.text = tweet.text
        
        
        screenNameLabel.text = "@\((tweet.user?.screenname)!)"
        
        //create userimage

        var userImageURL = user?.profileImageUrl
        userImage.setImageWithURL(NSURL (string: userImageURL!))
        userImage.layer.cornerRadius = 8.0
        userImage.clipsToBounds = true
        
        
        //create username label
        
        userNameLabel.text = user?.name
        
        
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
