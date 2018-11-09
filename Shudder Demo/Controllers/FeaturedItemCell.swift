//
//  FeaturedItemCell.swift
//  Shudder Demo
//
//  Created by Sam on 11/9/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Stevia
import PromiseKit

class FeaturedItemCell: UICollectionViewCell, Reusable {

    var item: FeaturedItem?

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        return view
    }()

    lazy var containerView: View = {
        let view = View()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = Colors.featuredBackgroundGray

        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: -1, height: 2.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2

        sv(containerView)
        containerView.fillContainer(2)

        containerView.sv(imageView)
        imageView.fillContainer()
    }

    func load() {
        DownloadManager.downloadSampleImage().then { image in
            self.imageView.image = image
        }
    }

    func set(item: FeaturedItem) {
        self.item = item
        if item.type == .hero {
            load()
        } else {
            load()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
