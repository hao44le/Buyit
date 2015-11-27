//
//  ViewController.swift
//  Buyit
//
//  Created by Gelei Chen on 22/9/2015.
//  Copyright © 2015 geleichen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,SEDraggableEventResponder {
    
    @IBOutlet weak var equalConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftView: SEDraggableLocation!
    @IBOutlet weak var rightView: SEDraggableLocation!

    
    let OBJECT_WIDTH : Float = Float(ScreenSize.SCREEN_HEIGHT / 2 )
    let OBJECT_HEIGHT : Float = Float(150)
    let MARGIN_VERTICAL : Float = 10.0
    let MARGIN_HORIZONTAL : Float = 10.0
    var success = false
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        self.equalConstraint.constant = 100
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setupDraggableLocations()
        self.setupDraggableObjects()
        self.setupViewOnRight()

    }
    
    override func viewWillAppear(animated: Bool) {
        if let name = NSUserDefaults.standardUserDefaults().stringForKey("userSelection") {
            self.navigationItem.title = name
        }
    }
    func showSuccess(){
        self.performSegueWithIdentifier("toPopup", sender: self)
    }
    
    func setupViewOnRight(){
        let label = UILabel(frame: CGRectMake(270 , ScreenSize.SCREEN_HEIGHT / 2 - 80, 80, 80))
        label.textAlignment = NSTextAlignment.Center
        label.text = "$5"
        label.font = UIFont.systemFontOfSize(40)
        self.rightView.addSubview(label)
        

    }
    
    
    func setupDraggableLocations(){
        self.leftView.backgroundColor = UIColor.clearColor()
        self.rightView.backgroundColor = UIColor.orangeColor()
        self.leftView.layer.borderColor = UIColor.purpleColor().CGColor
        self.leftView.layer.borderWidth = 3
        self.leftView.clipsToBounds = false
        self.configureDraggableLocation(self.leftView)
        self.configureDraggableLocation(self.rightView)
    }
    
    func configureDraggableLocation(draggableLocation:SEDraggableLocation){

        // set the width and height of the objects to be contained in this SEDraggableLocation (for spacing/arrangement purposes)
        draggableLocation.objectWidth = OBJECT_WIDTH;
        draggableLocation.objectHeight = OBJECT_HEIGHT;
        
        // set the bounding margins for this location
        draggableLocation.marginLeft = MARGIN_HORIZONTAL;
        draggableLocation.marginRight = MARGIN_HORIZONTAL;
        draggableLocation.marginTop = MARGIN_VERTICAL;
        draggableLocation.marginBottom = MARGIN_VERTICAL;
        
        // set the margins that should be preserved between auto-arranged objects in this location
        draggableLocation.marginBetweenX = MARGIN_HORIZONTAL;
        draggableLocation.marginBetweenY = MARGIN_VERTICAL;
        
        // set up highlight-on-drag-over behavior
        draggableLocation.highlightColor = UIColor.greenColor().CGColor
        draggableLocation.highlightOpacity = 0.4
        draggableLocation.shouldHighlightOnDragOver = true
        
        // you may want to toggle this on/off when certain events occur in your app
        draggableLocation.shouldAcceptDroppedObjects = true
        
        // set up auto-arranging behavior
        draggableLocation.shouldKeepObjectsArranged = true
        draggableLocation.fillHorizontallyFirst = true // NO makes it fill rows first
        draggableLocation.allowRows = true
        draggableLocation.allowColumns = true
        draggableLocation.shouldAnimateObjectAdjustments = true // if this is set to NO, objects will simply appear instantaneously at their new positions
        
        draggableLocation.animationDuration = 0.5
        draggableLocation.animationDelay = 0.0
        draggableLocation.animationOptions = UIViewAnimationOptions.LayoutSubviews  // UIViewAnimationOptionBeginFromCurrentState;
        
        
        draggableLocation.shouldAcceptObjectsSnappingBack = true
    }
    func setupDraggableObjects(){

        let pngs = ["Five_dollar_bill","One_dollar_bill","Ten_dollar_bill","Twenty_dollar_bill"]
        for  png in pngs {
            
            
            let image = UIImageView(image: UIImage(named: png))
            
            image.contentMode = UIViewContentMode.ScaleAspectFit
            image.frame = CGRectMake(0, 0, CGFloat(self.OBJECT_WIDTH), CGFloat(self.OBJECT_HEIGHT))
            let draggable = SEDraggable(imageView: image)
            draggable.delegate = self
            draggable.name = png
            self.configureDraggableObject(draggable)
            
        }

    }
   
    func configureDraggableObject(draggable:SEDraggable){
        
        draggable.homeLocation = self.leftView
        draggable.addAllowedDropLocation(self.rightView)
        draggable.addAllowedDropLocation(self.leftView)
        self.leftView.addDraggableObject(draggable, animated: false)
        
    }

    
    func draggableObject(object: SEDraggable!, finishedEnteringLocation location: SEDraggableLocation!, withEntryMethod entryMethod: SEDraggableLocationEntryMethod) {
        //print(object)
        if location == self.rightView {
            if object.name == "Five_dollar_bill" {
                self.success = true
                showSuccess()
            } else {
                self.success = false
                showSuccess()
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toPopup" {
            let vc = segue.destinationViewController as! MenuViewController
            let popupSegue = segue as! CCMPopupSegue
            popupSegue.destinationBounds = CGRectMake(0, 0, 800, 600)
            popupSegue.backgroundBlurRadius = 7
            popupSegue.backgroundViewAlpha = 0.3
            popupSegue.dismissableByTouchingBackground = true
            vc.success = self.success
        }
    }
}

