//
//  AppData.swift
//  Project1MagneticPoetry
//
//  Created by Benjamin Wilcox on 3/22/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import Foundation

/**
 * A singleton class that will manage
 * the different types of data in our
 * app
 */
class AppData {
    static let shared = AppData()
    
    /**
     * The currently selected wordset, must come from
     * avaliableWordsets
     */
    var selectedWordSet: WordSet!
    
    // MARK: - UserDefaults keys
    let wordSetKey = "wordsetKey"
    
    /**
     * The list of currently available wordsets
     */
    let availableWordSets = [
        WordSet(
            name: "Wolf",
            words: ["wolves", "vicious", "winter", "surround", "ing", "y", "ed", "door", "help", "scent", "need", "hope", "less", "hungry", "lost", "the", "is", "am", "exhaust", "come", "run", "sleep", "darkness"]),
        WordSet(
            name: "Arrr",
            words: ["ahoy", "matey", "shiver", "me", "timbers", "land", "ho", "avast", "lily-livered", "sea", "scallywag","s", "raise", "the", "jolly", "Roger", "doubloons", "Arr!", "Davey", "Jones", "locker", "a", "pirate", "'s", "life", "for", "me", "yo", "ho", "Yarr!"]),
        WordSet(
            name: "Bacon",
            words: ["the", "bacon", "most", "bacon", "important", "bacon", "meal", "bacon", "of", "bacon", "the", "bacon", "day", "bacon", "serving", "bacon", "it", "bacon", "up", "bacon", "Bacon", "'s", "bacon", "way"])
    ]
    
    /**
     * retrieve a wordset by its name
     */
    public func getWordSet(name: String) -> WordSet? {
        for wordset in availableWordSets {
            if (wordset.name == name) {
                return wordset
            }
        }
        return nil
    }
    
    /**
     * Initializes the AppData, setting up the initial
     * wordset
     */
    private init(){
        readDefaultsData()
    }
    
    
    // MARK: - UserDefaults Access
    
    /**
     * Sets the default properties of the app by retrieving them from 
     * UserDefaults
     */
    private func readDefaultsData() {
        let defaults = UserDefaults.standard
        
        // set the selected wordset from the one in UserDefaults
        // or use the first wordset in the array
        if let wordSetName = defaults.string(forKey: wordSetKey) {
            if let wordSet = getWordSet(name: wordSetName) {
                selectedWordSet = wordSet
            } else {
                selectedWordSet = availableWordSets[0]
            }
        } else {
            selectedWordSet = availableWordSets[0]
        }
    }
    
    /**
     * Save the current configuration to UserDefaults
     */
    public func saveDefaultsData() {
        print("saving defaults")
        let defaults = UserDefaults.standard
        defaults.set(selectedWordSet.name, forKey: wordSetKey)
        defaults.synchronize()
    }
}
