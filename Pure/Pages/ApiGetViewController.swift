//
//  ApiGetViewController.swift
//  Pure
//
//  Created by yoshiyuki ono on 2019/03/24.
//  Copyright © 2019 yono-ap. All rights reserved.
//

import UIKit

class ApiGetViewController: BaseViewController {
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelUrl: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var textViewResponse: UITextView!

    @IBAction func clickGet(_ sender: UIButton) {
        appTrace()
        if indicator.isAnimating {
            return
        }
        guard let url = URL(string: labelUrl.text ?? "") else {
            appLog("url is nil.")
            return
        }

        textViewResponse.text = ""
        indicator.startAnimating()

        DispatchQueue.global().async {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                if let response = response {
                    print(response)
                    if let data = data {
                        guard let text = String(data: data, encoding: String.Encoding.utf8) else {
                            DispatchQueue.main.async { self.textViewResponse.text = "encoding failed." }
                            return
                        }
                        DispatchQueue.main.async { self.textViewResponse.text = text }
                    } else {
                        DispatchQueue.main.async { self.textViewResponse.text = "data is nil." }
                    }
                } else {
                    DispatchQueue.main.async { self.textViewResponse.text = "Error : \(String(describing: error))" }
                }

                DispatchQueue.main.async { self.indicator.stopAnimating() }
            })
            task.resume()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelDescription.text = "This page uses GitHub API as an example of URLSession.".localized
        labelUrl.text = "https://api.github.com/users/yono-ap/repos"
        textViewResponse.text = ""
    }
}
