//
//  ViewController.swift
//  Buyit
//
//  Created by Gelei Chen on 22/9/2015.
//  Copyright © 2015 geleichen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var equalConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftView: SEDraggableLocation!
    @IBOutlet weak var rightView: SEDraggableLocation!

    
    let OBJECT_WIDTH : Float = Float(ScreenSize.SCREEN_HEIGHT / 4 - 50)
    let OBJECT_HEIGHT : Float = Float(ScreenSize.SCREEN_HEIGHT / 4 - 50)
    let MARGIN_VERTICAL : Float = 10.0
    let MARGIN_HORIZONTAL : Float = 10.0
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        self.equalConstraint.constant = -250
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupDraggableLocations()
        self.setupDraggableObjects()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        if let name = NSUserDefaults.standardUserDefaults().stringForKey("userSelection") {
            self.navigationItem.title = name
        }
    }
    
    
    func setupDraggableLocations(){
        self.leftView.backgroundColor = UIColor.clearColor()
        self.rightView.backgroundColor = UIColor.clearColor()
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
        draggableLocation.fillHorizontallyFirst = false // NO makes it fill rows first
        draggableLocation.allowRows = true
        draggableLocation.allowColumns = true
        draggableLocation.shouldAnimateObjectAdjustments = true // if this is set to NO, objects will simply appear instantaneously at their new positions
        
        draggableLocation.animationDuration = 0.5
        draggableLocation.animationDelay = 0.0
        draggableLocation.animationOptions = UIViewAnimationOptions.LayoutSubviews  // UIViewAnimationOptionBeginFromCurrentState;
        
        
        draggableLocation.shouldAcceptObjectsSnappingBack = true
    }
    func setupDraggableObjects(){

        let pngs = ["dimedemo", "red-applo", "bryn-applo", "cat", "dog", "monkey", "sheep", "robo-fox", "blue-applo"]
        for  png in pngs {
            let image = UIImageView(image: UIImage(named: png))
            image.contentMode = UIViewContentMode.ScaleAspectFill
            image.frame = CGRectMake(0, 0, CGFloat(self.OBJECT_WIDTH), CGFloat(self.OBJECT_HEIGHT))
            let draggable = SEDraggable(imageView: image)
            self.configureDraggableObject(draggable)
            
        }

    }
   
    func configureDraggableObject(draggable:SEDraggable){
        
        draggable.homeLocation = self.leftView
        draggable.addAllowedDropLocation(self.rightView)
        draggable.addAllowedDropLocation(self.leftView)
        self.leftView.addDraggableObject(draggable, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

