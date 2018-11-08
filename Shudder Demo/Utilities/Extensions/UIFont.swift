//
//  UIFont.swift
//  Shudder Demo
//
//  Created by Sam on 11/7/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

@objc enum FontStyle: Int {
    case normal, light, bold
}

extension UIFont {
    class func appFont(size: CGFloat) -> UIFont {
        if let font = UIFont(name: "RobotoCondensed-Bold", size: size) {
            return font
        }
        return UIFont.systemFont(ofSize: size)
    }

    class func attributesFor(type: FontStyle = .normal, color: UIColor, size: CGFloat) -> [NSAttributedStringKey: Any] {
        return [
            NSAttributedStringKey.font: UIFont.appFont(size: size),
            NSAttributedStringKey.foregroundColor: color
        ]
    }
}
