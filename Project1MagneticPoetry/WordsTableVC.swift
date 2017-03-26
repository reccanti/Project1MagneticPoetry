//
//  WordsTableVC.swift
//  Project1MagneticPoetry
//
//  Created by igmstu on 2/28/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import UIKit

enum WordTypes: Int {
    case Noun
    case Verb
    case Adjective
    case Conjunction
    case Pronoun
    case Suffix
    case Prefix
    case Determiner
    case Preposition
    case Interjection
    case Adverb
}

class WordsTableVC: UITableViewController {
    
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

    /**
     * Returns the number of sections that will be displayed in the table
     */
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    /**
     * Returns the number of rows in the given section
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.shared.availableWordSets.count
    }

    /**
     * Sets the text for the row at the given value
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = AppData.shared.availableWordSets[indexPath.row].name

        return cell
    }
    
    /**
     * Function that is called whenever a given row is selected.
     * This sets the selected wordset to the one at the given row
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppData.shared.selectedWordSet = AppData.shared.availableWordSets[indexPath.row]
    }
    
    // MARK: - IBActions
    
    /**
     * Dismisses View Controller when the cancel button is tapped
     */
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
