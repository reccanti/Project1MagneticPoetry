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
        WordSet(name: "Wolf set", words: [("wolves",WordTypes.Noun), ("vicious",WordTypes.Adjective), ("winter",WordTypes.Noun), ("surround",WordTypes.Verb), ("ing",WordTypes.Suffix), ("y",WordTypes.Suffix), ("ed",WordTypes.Suffix), ("door",WordTypes.Noun), ("help",WordTypes.Verb), ("scent",WordTypes.Noun), ("need",WordTypes.Verb), ("hope",WordTypes.Noun), ("less",WordTypes.Pronoun), ("hungry",WordTypes.Adjective), ("lost",WordTypes.Adjective), ("the",WordTypes.Determiner), ("is",WordTypes.Verb), ("am",WordTypes.Verb), ("exhaust",WordTypes.Verb), ("come",WordTypes.Verb), ("run",WordTypes.Verb), ("sleep",WordTypes.Verb), ("darkness",WordTypes.Noun)]),
        WordSet(name: "Arrr set", words: [("ahoy",WordTypes.Interjection), ("matey",WordTypes.Noun), ("shiver",WordTypes.Verb), ("me",WordTypes.Pronoun), ("timbers",WordTypes.Noun), ("land",WordTypes.Noun), ("ho",WordTypes.Interjection), ("avast",WordTypes.Verb), ("lily-livered",WordTypes.Adjective), ("sea",WordTypes.Noun), ("scallywag",WordTypes.Noun),("s",WordTypes.Suffix), ("raise",WordTypes.Verb), ("the",WordTypes.Determiner), ("jolly",WordTypes.Adjective), ("Roger",WordTypes.Pronoun), ("doubloons",WordTypes.Noun), ("Arr!",WordTypes.Interjection), ("Davey",WordTypes.Pronoun), ("Jones",WordTypes.Pronoun), ("locker",WordTypes.Noun), ("a",WordTypes.Determiner), ("pirate",WordTypes.Noun), ("'s",WordTypes.Suffix), ("life",WordTypes.Noun), ("for",WordTypes.Preposition), ("me",WordTypes.Pronoun), ("yo",WordTypes.Interjection), ("ho",WordTypes.Interjection), ("Yarr!",WordTypes.Interjection)]),
        WordSet(name: "Bacon set", words: [("the",WordTypes.Determiner), ("bacon",WordTypes.Noun), ("most",WordTypes.Adjective), ("umami",WordTypes.Noun), ("important",WordTypes.Adjective), ("juicy",WordTypes.Adjective), ("meal",WordTypes.Noun), ("bacon",WordTypes.Noun), ("of",WordTypes.Preposition), ("fried",WordTypes.Adjective), ("the",WordTypes.Determiner), ("bacon",WordTypes.Noun), ("day",WordTypes.Noun), ("bacon",WordTypes.Noun), ("served",WordTypes.Verb), ("plater",WordTypes.Noun), ("ing",WordTypes.Suffix), ("spice",WordTypes.Noun), ("it",WordTypes.Pronoun), ("bacon",WordTypes.Noun), ("up",WordTypes.Adverb), ("bacon",WordTypes.Noun), ("bacon",WordTypes.Noun), ("'s",WordTypes.Suffix), ("pork",WordTypes.Noun), ("a",WordTypes.Determiner), ("on",WordTypes.Preposition), ("way",WordTypes.Noun)])
    ]
    
    var selectedWordset: WordSet!
    
    
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
