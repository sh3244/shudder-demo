//
//  UIView.swift
//  Shudder Demo
//
//  Created by Sam on 11/8/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

extension UIView {
    func removeSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
}
