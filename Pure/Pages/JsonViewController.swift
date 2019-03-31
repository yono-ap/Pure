//
//  JsonViewController.swift
//  Pure
//
//  Created by yoshiyuki ono on 2019/03/26.
//  Copyright © 2019 yono-ap. All rights reserved.
//

import UIKit

class JsonViewController: UIViewController {
    var items: [ApiRepository] = []

    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelUrl: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func clickGet(_ sender: UIButton) {
        appTrace()
        if indicator.isAnimating {
            return
        }

        indicator.startAnimating()

        let serverApi = ServerApi<[ApiRepository]>()
        serverApi.apiGet(urlString: labelUrl.text ?? "", dataHandler: { apiRepository in
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.items = apiRepository
                self.tableView.reloadData()
            }

        }, errorHandler: { data, response, error in
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.httpErrorHandler(data: data, response: response, error: error)
            }

        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelDescription.text = "This page uses GitHub API as an example of URLSession.".localized
        labelUrl.text = "https://api.github.com/users/yono-ap/repos"

        tableView.delegate = self
        tableView.dataSource = self
    }

}

// MARK: - UITableViewDelegate
extension JsonViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension JsonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ??
            UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = items[indexPath.row].repositoryName
        cell.detailTextLabel?.text = items[indexPath.row].updatedAt.description
        return cell
    }

}
