//
//  ViewController
//  Shudder Demo
//
//  Created by Sam on 11/7/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        on("INJECTION BUNDLE NOTIFICATION") {
            self.layout()
        }
        self.layout()
    }

    func layout() {
        view.backgroundColor = .black


    }

}

