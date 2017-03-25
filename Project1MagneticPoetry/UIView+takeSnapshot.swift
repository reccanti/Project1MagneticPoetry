//
//  UIView+takeSnapshot.swift
//  Project1MagneticPoetry
//
//  Created by Thomas Bouffard (RIT Student) on 3/25/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func takeSnapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
