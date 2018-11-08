//
//  Label.swift
//  Shudder Demo
//
//  Created by Sam on 11/7/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

class Label: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)

        textAlignment = .center
        textColor = Colors.featuredTextGray

        font = UIFont.appFont(size: 14)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
