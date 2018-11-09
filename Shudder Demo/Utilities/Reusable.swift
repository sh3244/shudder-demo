//
//  Reusable.swift
//  Shudder Demo
//
//  Created by Sam on 11/9/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
