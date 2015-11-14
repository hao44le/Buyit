//
//  LeftViewController.swift
//  Buyit
//
//  Created by Gelei Chen on 29/9/2015.
//  Copyright © 2015 geleichen. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,RESideMenuDelegate {
    
    let titles = ["Money Recognition", "Money Addition",  "Money Game", "Setting"]
    let images =  [ "IconHome",  "IconCalendar",  "IconProfile","IconProfile"]
    var tableView : UITableView?
    var label : UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        label = UILabel(frame: CGRectMake(100, 40, self.view.frame.size.width / 2, 30))
        label?.textColor = UIColor.whiteColor()
        label?.font = UIFont.systemFontOfSize(30)
        label!.textAlignment = NSTextAlignment.Center
        self.view.addSubview(label!)
        
        
        tableView = UITableView(frame: CGRectMake(50, 60, self.view.frame.size.width - 50, self.view.frame.size.height - 60), style: UITableViewStyle.Plain)
        
        //
        tableView!.autoresizingMask = [.FlexibleTopMargin, .FlexibleBottomMargin,.FlexibleWidth]
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.opaque = false
        tableView!.backgroundColor = UIColor.clearColor()
        tableView!.backgroundView = nil
        tableView!.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView!.bounces = false
        tableView!.scrollsToTop = false
        tableView!.scrollEnabled = false
        //print(tableView.frame)
        self.view.addSubview(tableView!)
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView!.reloadData()
        let diff  = NSUserDefaults.standardUserDefaults().integerForKey("difficulty")
        if  diff != 0 {
            
            label?.text = "Difficulty Level : \(diff)"
            
        } else {
            label?.text = "Difficulty Level : 1"
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") {
            cell.textLabel!.text = titles[indexPath.row]
            cell.imageView!.image = UIImage(named: images[indexPath.row])
            //print(0)
            return cell
        } else {
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell.backgroundColor = UIColor.clearColor()
            cell.textLabel!.font = UIFont(name: "HelveticaNeue", size: 40)
            cell.textLabel!.textColor = UIColor.whiteColor()
            cell.textLabel!.highlightedTextColor = UIColor.lightGrayColor()
            cell.selectedBackgroundView = UIView()
            //print(1)
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 170
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            //print("Money Recognition")
            self.sideMenuViewController.setContentViewController(self.storyboard?.instantiateViewControllerWithIdentifier("contentViewController"), animated: true)
           NSUserDefaults.standardUserDefaults().setObject("Money Recognition", forKey: "userSelection")
            self.sideMenuViewController.hideMenuViewController()
        case 1:
            //print("Money Addition")
            self.sideMenuViewController.setContentViewController(self.storyboard?.instantiateViewControllerWithIdentifier("moneyAddition"), animated: true)
            NSUserDefaults.standardUserDefaults().setObject("Money Addition", forKey: "userSelection")
            self.sideMenuViewController.hideMenuViewController()
        case 2:
            //print("Money Game")
            self.sideMenuViewController.setContentViewController(self.storyboard?.instantiateViewControllerWithIdentifier("contentViewController"), animated: true)
            NSUserDefaults.standardUserDefaults().setObject("Money Game", forKey: "userSelection")
            self.sideMenuViewController.hideMenuViewController()
        case 3:
            self.performSegueWithIdentifier("toWelcome", sender: self)
        default:
            break
        }
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
