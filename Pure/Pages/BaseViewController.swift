//
//  BaseViewController.swift
//  Pure
//
//  Created by yoshiyuki ono on 2019/03/23.
//  Copyright © 2019 yono-ap. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        appTrace()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        appTrace()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        appTrace()
    }
}
