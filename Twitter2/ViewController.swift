//
//  ViewController.swift
//  Twitter2
//
//  Created by Laura Kirby on 10/15/14.
//  Copyright (c) 2014 LK. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onLogin(sender: AnyObject) {
        TwitterClient.sharedInstance.loginWithCompletion(){
            (user:User?, error: NSError?) in
            if user != nil {
               self.performSegueWithIdentifier("loginSegue", sender: self) 
            }else{
                NSLog("User is null")
            }
        }
        
    }


}

