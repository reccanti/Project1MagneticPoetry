//
//  ViewController.swift
//  Project1MagneticPoetry
//
//  Created by Benjamin Wilcox on 2/16/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let words = ["wolves", "vicious", "winter", "surround", "ing", "y", "ed", "door", "help", "scent", "need", "hope", "less", "hungry", "lost", "the", "is", "am", "exhaust", "come", "run", "sleep", "darkness"]

    override func viewDidLoad() {
        super.viewDidLoad()
        placeWords()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
     * Place words on the upper part of
     * the screen
     */
    func placeWords() {
        view.backgroundColor = UIColor.orange
        let lengthOffset: CGFloat = 5.0
        var rowLength: CGFloat = lengthOffset
        let initialHeight = lengthOffset + 30.0
        var rowHeight: CGFloat  = initialHeight
        
        for word in words {
            
            let label = UILabel()
            label.backgroundColor = UIColor.white
            label.text = " \(word) "
            label.sizeToFit()
            
            // get the leftmost position of the label
            let labelOffset = label.frame.size.width / 2
            
            // check to see if the this will go offscreen.
            // if so, start a new row
            if (rowLength + labelOffset + label.frame.size.width > view.frame.width) {
                rowLength = lengthOffset
                rowHeight += label.frame.size.height + lengthOffset
            }
            
            let x = rowLength + labelOffset + lengthOffset
            let y: CGFloat = rowHeight

            rowLength += label.frame.size.width + lengthOffset

            label.center = CGPoint(x: x, y: y)
            view.addSubview(label)
            
            label.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(doPanGesture))
            label.addGestureRecognizer(panGesture)
        }
    }
    
    /**
     * Allow a UILabel to be drawn
     */
    func doPanGesture(panGesture: UIPanGestureRecognizer) {
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }
}

