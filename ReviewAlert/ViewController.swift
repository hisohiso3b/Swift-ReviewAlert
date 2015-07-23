//
//  ViewController.swift
//  ReviewAlert
//
//  Created by hiso on 2015/07/23.
//  Copyright (c) 2015年 祐輔 花田. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ud = NSUserDefaults.standardUserDefaults()
    
    override func viewDidAppear(animated: Bool) {
        if !ud.boolForKey("reviewed") {
            let alertController = UIAlertController(
                title: "Congraturation!!!",
                message: "Thankyou for playing!!\nCould you review this app?",
                preferredStyle: .Alert)
            
            let reviewAction = UIAlertAction(title: "Review now", style: .Default) {
                action in
                let url = NSURL(string: "APP_STORE_URL")
                UIApplication.sharedApplication().openURL(url!)
                self.ud.setObject(true, forKey: "reviewed")
            }
            let yetAction = UIAlertAction(title: "not now", style: .Default) {
                action in
                self.ud.setObject(false, forKey: "reviewed")
            }
            let neverAction = UIAlertAction(title: "NEVER", style: .Cancel) {
                action in
                self.ud.setObject(true, forKey: "reviewed")
            }
            
            alertController.addAction(reviewAction)
            alertController.addAction(yetAction)
            alertController.addAction(neverAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

