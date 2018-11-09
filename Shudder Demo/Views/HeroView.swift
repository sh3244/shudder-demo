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
        view.layer.cornerRadius = 5
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.featuredTextGray

        removeSubviews()

        sv([imageView])
        imageView.fillContainer(4)
//        imageView.layer.applyShadow(color: .black, alpha: 1, offset: CGSize(width: 2, height: 2), blur: 2, spread: 2)
        imageView.backgroundColor = .yellow
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
