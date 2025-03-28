//
//  SnackListViewController.swift
//  A2_Jessica_101445909_
//
//  Created by jessica lee on 2025-03-28.
//

import UIKit

class SnackListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var snacks: [ProductEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        snacks = ProductManager.shared.fetchProducts()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        snacks = ProductManager.shared.fetchProducts()
        tableView.reloadData()
    }

    // MARK: - TableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let snack = snacks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SnackCell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = snack.name
        config.secondaryText = snack.productDescription
        cell.contentConfiguration = config
        return cell
    }
}
