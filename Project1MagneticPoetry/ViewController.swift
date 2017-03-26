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
        placeWords(wordset: AppData.shared.selectedWordSet)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(saveDefaultsData),
            name: NSNotification.Name.UIApplicationWillResignActive,
            object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
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
            
            
            switch word.1 {
            case WordTypes.Verb:
                label.backgroundColor = #colorLiteral(red: 1, green: 0.6617908478, blue: 0.6757833958, alpha: 1)
                
            case WordTypes.Adjective:
                label.backgroundColor = #colorLiteral(red: 1, green: 0.8466758728, blue: 0.5059751272, alpha: 1)
                
            case WordTypes.Conjunction:
                label.backgroundColor = #colorLiteral(red: 0.9896666408, green: 0.9449744821, blue: 0.6159284711, alpha: 1)
                
            case WordTypes.Pronoun:
                label.backgroundColor = #colorLiteral(red: 0.8029432893, green: 0.9747024179, blue: 0.4887778163, alpha: 1)
                
            case WordTypes.Determiner:
                label.backgroundColor = #colorLiteral(red: 0.6529548168, green: 0.9764088988, blue: 0.7021540403, alpha: 1)
                
            case WordTypes.Preposition:
                label.backgroundColor = #colorLiteral(red: 0.739595592, green: 0.9772180915, blue: 0.9894768596, alpha: 1)
                
            case WordTypes.Interjection:
                label.backgroundColor = #colorLiteral(red: 0.6818062663, green: 0.7663550973, blue: 0.9898191094, alpha: 1)
                
            case WordTypes.Adverb:
                label.backgroundColor = #colorLiteral(red: 0.7850539088, green: 0.6974565387, blue: 0.9897738099, alpha: 1)
                
            case WordTypes.Noun:
                label.backgroundColor = #colorLiteral(red: 1, green: 0.7044786811, blue: 0.8498353958, alpha: 1)
                
            case WordTypes.Prefix:
                label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                
            case WordTypes.Suffix:
                label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            }
            
            
            label.text = " \(word.0) "
            
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
    
    /**
     * When this view is exited, save the config to
     * user defaults
     */
    func saveDefaultsData() {
        AppData.shared.saveDefaultsData()
    }
    
    // MARK: - Functions for unwinding to this view
    
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
            replaceWords(wordset: AppData.shared.selectedWordSet)
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

