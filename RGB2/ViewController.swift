//
//  ViewController.swift
//  RGB Sliders
//
//  Created by LusahAir13 on 8/11/15.
//  Copyright (c) 2015 Lusah. All rights reserved.
//
// Commet added


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
  
    @IBOutlet weak var colorSquare: UIView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        colorSquare.layer.borderColor = UIColor.blackColor().CGColor
        colorSquare.layer.borderWidth = 1
        
        let defaults = NSUserDefaults.standardUserDefaults()
        redSlider.value = defaults.floatForKey("redSaved")
        greenSlider.value = defaults.floatForKey("greenSaved")
        blueSlider.value = defaults.floatForKey("blueSaved")
        
        updateBackgroundColor()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "openColor") {
            let newViewController = segue.destinationViewController as! UIViewController
            newViewController.view.backgroundColor = colorSquare.backgroundColor
        }}
    
    @IBAction func updateBackgroundColor() {
        
        let redValue = CGFloat(redSlider.value)
        let greenValue = CGFloat(greenSlider.value)
        let blueValue = CGFloat(blueSlider.value)
        
        colorSquare.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        
        let defaults = NSUserDefaults.standardUserDefaults()  //1
        defaults.setFloat(redSlider.value, forKey: "redSaved")   //2
        defaults.setFloat(greenSlider.value, forKey: "greenSaved")
        defaults.setFloat(blueSlider.value, forKey: "blueSaved")
        defaults.synchronize()    //3
    }

    
}

