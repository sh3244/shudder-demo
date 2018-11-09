//
//  FeaturedItem.swift
//  Shudder Demo
//
//  Created by Sam on 11/9/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation

@objc enum FeaturedType: Int {
    case hero, category
}

class FeaturedItem: Equatable {
    var name: String = ""
    var type: FeaturedType = .category

    init(name: String, type: FeaturedType = .category) {
        self.name = name
        self.type = type
    }

    static func == (lhs: FeaturedItem, rhs: FeaturedItem) -> Bool {
        return lhs.name == rhs.name && lhs.type == rhs.type
    }
}
