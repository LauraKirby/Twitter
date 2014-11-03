//
//  RetweetViewController.swift
//  Twitter2
//
//  Created by Laura Kirby on 11/1/14.
//  Copyright (c) 2014 LK. All rights reserved.
//

import UIKit

class RetweetViewController: UIViewController {
    @IBOutlet weak var cancelRetweetButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
  
}
