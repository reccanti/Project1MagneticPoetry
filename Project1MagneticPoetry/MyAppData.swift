//
//  MyAppData.swift
//  Project1MagneticPoetry
//
//  Created by Benjamin Wilcox on 3/2/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import Foundation

class MyAppData {
    static let shared = MyAppData()
    var counterTotal = 0
    var dateString = "Last used: never"
    
    private init() {
        print("Created MyAppData instance")
    }
}
