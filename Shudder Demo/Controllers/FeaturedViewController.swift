//
//  FeaturedViewController
//  Shudder Demo
//
//  Created by Sam on 11/7/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Stevia
import Dwifft

class FeaturedCategoryCell: UITableViewCell, Reusable {
    var featuredCategoryVC: FeaturedCategoryViewController?
    weak var parentVC: ViewController?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
    }

//    func setup(parentVC: ViewController?, entry: DiscoverEntry, indexPath: IndexPath) {
//        if self.parentVC == nil {
//            self.parentVC = parentVC
//            self.feedItemVC = DiscoverFeedItemViewController()
//
//            guard let feedItemVC = self.feedItemVC else { return }
//            feedItemVC.parentVC = parentVC
//
//            parentVC?.addChildViewController(feedItemVC)
//            sv(feedItemVC.view)
//            feedItemVC.view.fillContainer()
//            // NOTE: Settings width == width is required to fix some weird autolayout behavior where the cell would not take up
//            // the entire width of the table view
//            feedItemVC.view.Width == Width
//
//            feedItemVC.entry = entry
//            feedItemVC.beginAppearanceTransition(true, animated: false)
//            feedItemVC.endAppearanceTransition()
//        } else {
//            guard let feedItemVC = self.feedItemVC else { return }
//            feedItemVC.entry = entry
//            feedItemVC.beginAppearanceTransition(true, animated: false)
//            feedItemVC.endAppearanceTransition()
//        }
//    }

    override func prepareForReuse() {
        super.prepareForReuse()
//        feedItemVC?.clear()
//        feedItemVC?.beginAppearanceTransition(false, animated: false)
//        feedItemVC?.endAppearanceTransition()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    deinit {
        contentView.removeSubviews()
//        feedItemVC?.clear()
//        feedItemVC?.beginAppearanceTransition(false, animated: false)
//        feedItemVC?.endAppearanceTransition()
//        feedItemVC?.removeFromParentViewController()
//        feedItemVC = nil
    }
}

class FeaturedCategory: Equatable {
    var name: String = ""

    init(name: String) {
        self.name = name
    }

    static func == (lhs: FeaturedCategory, rhs: FeaturedCategory) -> Bool {
        return lhs.name == rhs.name
    }
}

class FeaturedViewController: ViewController {

    var diffCalculator: TableViewDiffCalculator<String, FeaturedCategory>?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FeaturedCategoryCell.self, forCellReuseIdentifier: FeaturedCategoryCell.reuseIdentifier)

        diffCalculator = TableViewDiffCalculator(tableView: tableView, initialSectionedValues: SectionedValues([("", [])]))
        diffCalculator?.insertionAnimation = .fade
        diffCalculator?.deletionAnimation = .fade

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        on("INJECTION BUNDLE NOTIFICATION") {
            self.layout()
        }
        self.layout()
    }

    func layout() {
        title = "Main"
        view.removeSubviews()

        let heroView = HeroView()
        view.sv(heroView)
        heroView.centerInContainer()
        heroView.size(300)
    }

}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let diffCalculator = self.diffCalculator else { return 0 }
        return diffCalculator.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let diffCalculator = self.diffCalculator else { return 0 }
        let count = diffCalculator.numberOfObjects(inSection: section)
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let featuredCell = tableView.dequeueReusableCell(withIdentifier: FeaturedCategoryCell.reuseIdentifier, for: indexPath) as? FeaturedCategoryCell else {
            return FeaturedCategoryCell()
        }
        guard let entry = diffCalculator?.value(atIndexPath: indexPath) else { return featuredCell }
//        featuredCell.setup(parentVC: self, entry: entry, indexPath: indexPath)
        return featuredCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
