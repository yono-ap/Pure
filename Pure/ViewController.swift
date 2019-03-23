//
//  ViewController.swift
//  Pure
//
//  Created by yoshiyuki ono on 2019/03/23.
//  Copyright © 2019 yono-ap. All rights reserved.
//

import UIKit

/// Container ViewController
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        appTrace()

        let viewController = HomeViewController()
        viewController.title = "Home"
        let navigationController = UINavigationController(rootViewController: viewController)
        addChild(navigationController)
        view.addSubview(navigationController.view)
        navigationController.didMove(toParent: self)
    }

}
