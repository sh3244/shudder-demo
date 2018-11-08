//
//  HeroView.swift
//  Shudder Demo
//
//  Created by Sam on 11/7/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

class HeroView: View {

    lazy var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .gray
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func layout() {
        backgroundColor = .gray

        removeSubviews()

        sv([imageView])
        imageView.fillContainer(4)
        imageView.layer.applyShadow(color: .black, alpha: 1, offset: CGSize(width: 2, height: 2), blur: 2, spread: 2)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
