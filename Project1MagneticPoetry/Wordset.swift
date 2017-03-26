//
//  Wordset.swift
//  Project1MagneticPoetry
//
//  Created by Benjamin Wilcox on 2/28/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import Foundation

class WordSet {
    
    var name: String!
    //var words: [String]!
    //var words: [[String]]!
    var words: [(String,WordTypes)]!
    
    init(name: String, words: [(String,WordTypes)]) {
        self.name = name
        self.words = words
    }
}
