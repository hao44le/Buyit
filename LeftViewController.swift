//
//  LeftViewController.swift
//  Buyit
//
//  Created by Gelei Chen on 29/9/2015.
//  Copyright © 2015 geleichen. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let titles = ["Money Recognition", "Money Addition",  "Money Game"]
    let images =  [ "IconHome",  "IconCalendar",  "IconProfile"]
    var tableView : UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 60), style: UITableViewStyle.Plain)
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
        return 200
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
