//
//  FeaturedCell.swift
//  Shudder Demo
//
//  Created by Sam on 11/9/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Stevia

class FeaturedCell: UITableViewCell, Reusable {
    var featuredItemVC: FeaturedItemViewController?
    weak var parentVC: ViewController?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Colors.featuredBackgroundGray
    }

    func setup(parentVC: ViewController?, item: FeaturedItem) {
        if self.parentVC == nil {
            self.parentVC = parentVC
            self.featuredItemVC = FeaturedItemViewController()

            guard let featuredItemVC = self.featuredItemVC else { return }

            parentVC?.addChildViewController(featuredItemVC)
            sv(featuredItemVC.view)
            featuredItemVC.view.fillContainer()
            featuredItemVC.view.Width == Width

            featuredItemVC.item = item

            featuredItemVC.beginAppearanceTransition(true, animated: false)
            featuredItemVC.endAppearanceTransition()
        } else {
            guard let featuredItemVC = self.featuredItemVC else { return }
            featuredItemVC.item = item
            featuredItemVC.beginAppearanceTransition(true, animated: false)
            featuredItemVC.endAppearanceTransition()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    deinit {

    }
}
