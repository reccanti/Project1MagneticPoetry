//
//  ViewController.swift
//  Project1MagneticPoetry
//
//  Created by Benjamin Wilcox on 2/16/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var backgroundImage:UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        placeWords(wordset: WordSet(name: "blank", words: []))
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
    func placeWords(wordset: WordSet) {
        view.backgroundColor = UIColor.orange
        let lengthOffset: CGFloat = 5.0
        var rowLength: CGFloat = lengthOffset
        let initialHeight = lengthOffset + 30.0
        var rowHeight: CGFloat  = initialHeight
        
        for word in wordset.words {
            
            let label = UILabel()
            label.backgroundColor = UIColor.white
            label.text = " \(word) "
            
            // increase font size on Ipads
            if (UIDevice.current.userInterfaceIdiom == .pad) {
                label.font = UIFont.systemFont(ofSize: 30, weight: UIFontWeightRegular)
             }
            
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
     * Remove the Labels from the screen so that it
     * can be replaced with new ones
     */
    func clearWords() {
        for v in view.subviews{
            if v is UILabel{
                v.removeFromSuperview()
            }
        }
    }
    
    /**
     * Clear the screen of UILabels and
     */
    func replaceWords(wordset: WordSet) {
        clearWords()
        placeWords(wordset: wordset)
    }
    
    /**
     * Allow a UILabel to be drawn
     */
    func doPanGesture(panGesture: UIPanGestureRecognizer) {
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "showWordSegue")
        {
            let _ = segue.destination.childViewControllers[0] as! WordsTableVC
            
        }
    }
    
    @IBAction func unwindToMain(segue:UIStoryboardSegue)
    {
        if (segue.identifier == "DoneTapped")
        {
            let wordsVC = segue.source as! WordsTableVC
            replaceWords(wordset: wordsVC.selectedWordset)
        }
    }
    
    @IBAction func share(_ sender:AnyObject) {
        let image = self.view.takeSnapshot()
        let textToShare = "I just used Magnetic Poetry!"
        let Website = NSURL(string: "https://github.com/reccanti/Project1MagneticPoetry")
        let objectsToShare:[AnyObject] = [textToShare as AnyObject,Website!,image!]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityType.print]
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            activityVC.popoverPresentationController?.sourceView = self.view
        }
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func cameraButtonTapped(_ sender: AnyObject) {
        let imagePickerController = UIImagePickerController()

        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        self.present(imagePickerController, animated: true, completion: { imageP in })
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("finished picking")
        let image:UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        backgroundImage = image
        (self.view as! UIImageView).contentMode = .scaleAspectFit
        (self.view as! UIImageView).image = backgroundImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancelled")
        picker.dismiss(animated: true, completion: nil)
    }
}

