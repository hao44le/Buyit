//
//  MenuViewController.swift
//  Buyit
//
//  Created by Gelei Chen on 9/11/2015.
//  Copyright © 2015 geleichen. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var success = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        let imageView = UIImageView(frame: CGRectMake(0, 0, 800, 600))
        if success {
           imageView.animationImages = [UIImage(named: "firework5")!,UIImage(named: "firework1")!,UIImage(named: "firework2")!,UIImage(named: "firework3")!,UIImage(named: "firework4")!]
        } else {
            imageView.animationImages = [UIImage(named: "fail1")!,UIImage(named: "fail2")!,UIImage(named: "fail3")!,UIImage(named: "fail4")!]
        }
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.animationDuration = 5
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        self.view.addSubview(imageView)
        
         NSTimer.scheduledTimerWithTimeInterval(6, target: self, selector: "dismiss", userInfo: nil, repeats: false)
        
        // Do any additional setup after loading the view.
    }
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)

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
