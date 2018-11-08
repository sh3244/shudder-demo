//
//  MainViewController.swift
//  Shudder Demo
//
//  Created by Sam on 11/7/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

class MainViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func layout() {
        title = "Main"
        view.removeSubviews()

        let heroView = HeroView()
        view.sv(heroView)
        heroView.centerInContainer()
        heroView.size(300)
    }

}
