//
//  WelcomeViewController.swift
//  Buyit
//
//  Created by Gelei Chen on 15/10/2015.
//  Copyright © 2015 geleichen. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func startClicked(sender: UIButton) {
        self.performSegueWithIdentifier("toMain", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 31/255, green: 61/255, blue: 91/255, alpha: 1)
        timeLabel.text = "1"
        startButton.hidden = true
        startButton.backgroundColor = UIColor(red: 98/255, green: 243/255, blue: 252/255, alpha: 1)
        startButton.layer.cornerRadius = 35
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        let hourSliderFrame: CGRect = CGRectMake(width / 2 - 250 , height / 2 - 150, 500, 500)
        let hourSlider: EFCircularSlider = EFCircularSlider(frame: hourSliderFrame)
        hourSlider.unfilledColor = UIColor(red:23 / 255.0, green: 47 / 255.0, blue: 70 / 255.0, alpha: 1.0)
        hourSlider.filledColor = UIColor(red: 98/255, green: 243/255, blue: 252/255, alpha: 1)
        
        hourSlider.innerMarkingLabels = (["2", "3", "1"])
        hourSlider.labelFont = UIFont.systemFontOfSize(40.0)
        hourSlider.lineWidth = 20
        hourSlider.snapToLabels = false
        hourSlider.minimumValue = -1
        hourSlider.maximumValue = 3
        hourSlider.labelColor = UIColor(red:127 / 255.0, green: 229 / 255.0, blue: 255 / 255.0, alpha: 1.0)
        hourSlider.handleType = CircularSliderHandleTypeDoubleCircleWithClosedCenter
        
        hourSlider.handleColor = hourSlider.filledColor;
        self.view.addSubview(hourSlider)
        self.view.sendSubviewToBack(hourSlider)
        hourSlider.addTarget(self, action: "hourDidChange:", forControlEvents: UIControlEvents.ValueChanged)
        // Do any additional setup after loading the view.
    }
    
    func hourDidChange(slider: EFCircularSlider) {
        var value = Int(slider.currentValue + 0.5)
        if value == 0 {
            value = 1
        }
        if value == 4 {
            value = 3
        }
        startButton.hidden = false
        timeLabel.text = NSString(format: "%d", value) as String
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
