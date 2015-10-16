//
//  LeftViewController.swift
//  Buyit
//
//  Created by Gelei Chen on 29/9/2015.
//  Copyright © 2015 geleichen. All rights reserved.
//

import UIKit

class RootViewController: RESideMenu,RESideMenuDelegate {

    override func awakeFromNib() {
        self.contentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("contentViewController") as! UINavigationController
        self.leftMenuViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LeftViewController") as! LeftViewController
        
        self.menuPreferredStatusBarStyle = UIStatusBarStyle.LightContent
        self.contentViewShadowColor = UIColor.blackColor()
        self.contentViewShadowOffset = CGSizeMake(0, 0)
        self.contentViewShadowOpacity = 0.6
        self.contentViewShadowRadius = 12
        self.contentViewShadowEnabled = true
        self.backgroundImage = UIImage(named: "Stars")
        self.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.performSegueWithIdentifier("showWelcome", sender: self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
