//
//  HomeViewController.swift
//  Pure
//
//  Created by yoshiyuki ono on 2019/03/23.
//  Copyright © 2019 yono-ap. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet weak var labelDescription: UILabel!

    struct CellItem {
        let title: String
        let name: String

        init(title: String, name: String) {
            self.title = title
            self.name = name
        }
    }

    struct SectionItem {
        let title: String
        let cellItems: [CellItem]

        init(title: String, cellItems: [CellItem]) {
            self.title = title
            self.cellItems = cellItems
        }
    }

    let items: [SectionItem] = [
        SectionItem(title: "Communications", cellItems: [
            CellItem(title: "API GET", name: "v11"),
            CellItem(title: "JSON", name: "v12")
            ]),
        SectionItem(title: "Views", cellItems: [
            CellItem(title: "Button", name: "v21"),
            CellItem(title: "Entry", name: "v22")
            ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelDescription.text = "The following is a list of test programs."
    }

}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = "\(items[indexPath.section].cellItems[indexPath.row].title)"
        appLog("index = \(indexPath.section) : \(indexPath.row) \(title)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].cellItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        cell.textLabel?.text=items[indexPath.section].cellItems[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].title
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
}
