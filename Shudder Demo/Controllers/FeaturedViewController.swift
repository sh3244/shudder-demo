//
//  FeaturedViewController
//  Shudder Demo
//
//  Created by Sam on 11/7/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Stevia
import Dwifft

class FeaturedViewController: ViewController {

    var diffCalculator: TableViewDiffCalculator<String, FeaturedItem>?

    let sampleFeaturedItems: [FeaturedItem] = [
        FeaturedItem(name: "Hero", type: .hero),
        FeaturedItem(name: "Newly Added"),
        FeaturedItem(name: "Curator's Choice"),
        FeaturedItem(name: "Only On Shudder"),
        FeaturedItem(name: "Newly Added"),
        FeaturedItem(name: "Curator's Choice"),
        FeaturedItem(name: "Only On Shudder"),
        FeaturedItem(name: "Newly Added"),
        FeaturedItem(name: "Curator's Choice"),
        FeaturedItem(name: "Only On Shudder")
    ]

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Colors.featuredBackgroundGray

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FeaturedCell.self, forCellReuseIdentifier: FeaturedCell.reuseIdentifier)

        tableView.allowsSelection = false
        tableView.separatorColor = .clear

        diffCalculator = TableViewDiffCalculator(tableView: tableView, initialSectionedValues: SectionedValues([("", [])]))
        diffCalculator?.insertionAnimation = .fade
        diffCalculator?.deletionAnimation = .fade

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Shudder"
        navigationController?.navigationBar.backgroundColor = Colors.featuredBackgroundGray
        navigationController?.navigationBar.barTintColor = Colors.featuredBackgroundGray
        navigationController?.navigationBar.barStyle = .blackOpaque

        view.sv(tableView)
        tableView.fillContainer()

        diffCalculator?.sectionedValues = SectionedValues([("", sampleFeaturedItems)])
    }

    override var shouldAutomaticallyForwardAppearanceMethods: Bool {
        return false
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
        guard let featuredCell = tableView.dequeueReusableCell(withIdentifier: FeaturedCell.reuseIdentifier, for: indexPath) as? FeaturedCell else {
            return FeaturedCell()
        }
        guard let item = diffCalculator?.value(atIndexPath: indexPath) else { return featuredCell }
        featuredCell.setup(parentVC: self, item: item)
        return featuredCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let bounds = UIScreen.main.bounds
        guard let item = diffCalculator?.value(atIndexPath: indexPath) else { return 0 }
        return item.type == .category ? bounds.width/5*1.6 + 36 : bounds.width/1.8+20
    }
}
