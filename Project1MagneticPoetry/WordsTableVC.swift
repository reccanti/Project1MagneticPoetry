//
//  WordsTableVC.swift
//  Project1MagneticPoetry
//
//  Created by igmstu on 2/28/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import UIKit

class WordsTableVC: UITableViewController {
    
    let wordsetList = [
        WordSet(name: "Wolfset", words: ["wolves", "vicious", "winter", "surround", "ing", "y", "ed", "door", "help", "scent", "need", "hope", "less", "hungry", "lost", "the", "is", "am", "exhaust", "come", "run", "sleep", "darkness"]),
        WordSet(name: "Arrrset", words: ["ahoy", "matey", "shiver", "me", "timbers", "land", "ho", "avast", "lily-livered", "sea", "scallywag","s", "raise", "the", "jolly", "Roger", "doubloons", "Arr!", "Davey", "Jones", "locker", "a", "pirate", "'s", "life", "for", "me", "yo", "ho", "Yarr!"]),
        WordSet(name: "Baconset", words: ["the", "bacon", "most", "bacon", "important", "bacon", "meal", "bacon", "of", "bacon", "the", "bacon", "day", "bacon", "serving", "bacon", "it", "bacon", "up", "bacon", "Bacon", "'s", "bacon", "way"])
    ]
    
    var selectedWordset: WordSet!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Word Groups"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = wordsetList[indexPath.row].name
        
        /*if (UIDevice.current.userInterfaceIdiom == .pad) {
            cell.textLabel?.font.set
            print("the point size is:  /(cell.textLabel?.font.pointSize)")
        }*/
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWordset = wordsetList[indexPath.row]
    }
    
    @IBAction func cancelTapped(sender: AnyObject)
    {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
