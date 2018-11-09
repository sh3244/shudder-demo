//
//  FeaturedItemViewController.swift
//  Shudder Demo
//
//  Created by Sam on 11/7/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Stevia

class FeaturedItemViewController: ViewController {

    var item: FeaturedItem?

    let fakeInfinity: Int = 10000

    lazy var titleLabel: Label = {
        let label = Label()
        label.textColor = Colors.featuredTextGray
        label.font = UIFont.appFont(size: 16)
        label.textAlignment = .left
        return label
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FeaturedItemCell.self, forCellWithReuseIdentifier: FeaturedItemCell.reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = Colors.featuredBackgroundGray
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.alwaysBounceVertical = false
        collectionView.alwaysBounceHorizontal = true

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.featuredBackgroundGray
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let item = self.item else { return }
        titleLabel.text = item.name

        collectionView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if self.item?.type == .hero {
            layoutHero()

            let midIndexPath = IndexPath(row: fakeInfinity / 2, section: 0)
            collectionView.scrollToItem(at: midIndexPath,
                                        at: .centeredHorizontally,
                                        animated: false)
        } else {
            layoutCategory()
        }
    }

    func layoutCategory() {
        view.removeSubviews()

        view.sv(titleLabel)
        titleLabel.left(10).top(8).right(10).height(20)

        view.sv(collectionView)
        collectionView.Top == titleLabel.Bottom + 5
        collectionView.fillHorizontally().bottom(0)
    }

    func layoutHero() {
        view.removeSubviews()

        view.sv(collectionView)
        collectionView.fillContainer()
    }
}

extension FeaturedItemViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let featuredItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedItemCell.reuseIdentifier, for: indexPath) as? FeaturedItemCell else { return FeaturedItemCell() }
        if let item = self.item {
            featuredItemCell.set(item: item)
        }
        return featuredItemCell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let item = self.item, item.type == .hero {
            return 10000 // Fake infinite scroll
        }
        return 5
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds

        if let item = self.item, item.type == .hero {
            let width = bounds.width/1.2
            return CGSize(width: width, height: bounds.width/1.8)
        } else {
            let width = bounds.width/5
            return CGSize(width: width, height: width*1.6)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
