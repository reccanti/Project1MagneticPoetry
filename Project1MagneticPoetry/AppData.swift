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
    var selectedWordset: WordSet
    let availableWordsets = [
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
    
    private init(){
        selectedWordset = availableWordsets[0]
    }
}
