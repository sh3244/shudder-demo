//
//  View.swift
//  Shudder Demo
//
//  Created by Sam on 11/7/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Stevia

class View: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        on("INJECTION BUNDLE NOTIFICATION") {
            self.layout()
        }
        self.layout()
    }

    func layout() {

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
