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
    
    let wordsetList = [
        WordSet(name: "Wolf set", words: [("wolves",WordTypes.Noun), ("vicious",WordTypes.Adjective), ("winter",WordTypes.Noun), ("surround",WordTypes.Verb), ("ing",WordTypes.Suffix), ("y",WordTypes.Suffix), ("ed",WordTypes.Suffix), ("door",WordTypes.Noun), ("help",WordTypes.Verb), ("scent",WordTypes.Noun), ("need",WordTypes.Verb), ("hope",WordTypes.Noun), ("less",WordTypes.Pronoun), ("hungry",WordTypes.Adjective), ("lost",WordTypes.Adjective), ("the",WordTypes.Determiner), ("is",WordTypes.Verb), ("am",WordTypes.Verb), ("exhaust",WordTypes.Verb), ("come",WordTypes.Verb), ("run",WordTypes.Verb), ("sleep",WordTypes.Verb), ("darkness",WordTypes.Noun)]),
        WordSet(name: "Arrr set", words: [("ahoy",WordTypes.Interjection), ("matey",WordTypes.Noun), ("shiver",WordTypes.Verb), ("me",WordTypes.Pronoun), ("timbers",WordTypes.Noun), ("land",WordTypes.Noun), ("ho",WordTypes.Interjection), ("avast",WordTypes.Verb), ("lily-livered",WordTypes.Adjective), ("sea",WordTypes.Noun), ("scallywag",WordTypes.Noun),("s",WordTypes.Suffix), ("raise",WordTypes.Verb), ("the",WordTypes.Determiner), ("jolly",WordTypes.Adjective), ("Roger",WordTypes.Pronoun), ("doubloons",WordTypes.Noun), ("Arr!",WordTypes.Interjection), ("Davey",WordTypes.Pronoun), ("Jones",WordTypes.Pronoun), ("locker",WordTypes.Noun), ("a",WordTypes.Determiner), ("pirate",WordTypes.Noun), ("'s",WordTypes.Suffix), ("life",WordTypes.Noun), ("for",WordTypes.Preposition), ("me",WordTypes.Pronoun), ("yo",WordTypes.Interjection), ("ho",WordTypes.Interjection), ("Yarr!",WordTypes.Interjection)]),
        WordSet(name: "Bacon set", words: [("the",WordTypes.Determiner), ("bacon",WordTypes.Noun), ("most",WordTypes.Adjective), ("umami",WordTypes.Noun), ("important",WordTypes.Adjective), ("juicy",WordTypes.Adjective), ("meal",WordTypes.Noun), ("bacon",WordTypes.Noun), ("of",WordTypes.Preposition), ("fried",WordTypes.Adjective), ("the",WordTypes.Determiner), ("bacon",WordTypes.Noun), ("day",WordTypes.Noun), ("bacon",WordTypes.Noun), ("served",WordTypes.Verb), ("plater",WordTypes.Noun), ("ing",WordTypes.Suffix), ("spice",WordTypes.Noun), ("it",WordTypes.Pronoun), ("bacon",WordTypes.Noun), ("up",WordTypes.Adverb), ("bacon",WordTypes.Noun), ("bacon",WordTypes.Noun), ("'s",WordTypes.Suffix), ("pork",WordTypes.Noun), ("a",WordTypes.Determiner), ("on",WordTypes.Preposition), ("way",WordTypes.Noun)])
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
