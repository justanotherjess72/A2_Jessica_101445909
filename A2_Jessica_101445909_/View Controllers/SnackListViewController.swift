//
//  SnackListViewController.swift
//  A2_Jessica_101445909_
//
//  Created by jessica lee on 2025-03-28.
//

import UIKit

class SnackListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //  IBOutlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!

    // Properties

    var snacks: [ProductEntity] = []

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        snacks = ProductManager.shared.fetchProducts()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.backgroundColor = UIColor.systemPink.withAlphaComponent(0.05)

        styleUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        snacks = ProductManager.shared.fetchProducts()
        tableView.reloadData()
    }

    // UI Styling

    func styleUI() {
        view.backgroundColor = UIColor.systemPink.withAlphaComponent(0.05)

        screenTitleLabel.text = "All Snacks"
        screenTitleLabel.font = UIFont(name: "AvenirNext-Bold", size: 30)
        screenTitleLabel.textColor = .darkGray
        screenTitleLabel.textAlignment = .center

        backButton.setTitle("Back to Home", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = UIColor.systemPink
        backButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
        backButton.layer.cornerRadius = 10
    }

    // IBActions

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }

    // TableView Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let snack = snacks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SnackCell", for: indexPath)

        cell.backgroundColor = UIColor.white.withAlphaComponent(0.85)
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.selectionStyle = .none

        var config = cell.defaultContentConfiguration()
        config.text = snack.name
        config.secondaryText = snack.productDescription
        config.textProperties.font = UIFont(name: "AvenirNext-Medium", size: 18)!
        config.secondaryTextProperties.font = UIFont(name: "AvenirNext-Regular", size: 14)!
        cell.contentConfiguration = config

        return cell
    }
}
