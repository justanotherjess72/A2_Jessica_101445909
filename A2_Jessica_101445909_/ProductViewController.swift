//
//  ProductViewController.swift
//  A2_Jessica_101445909_
//
//  Created by jessica lee on 2025-03-28.
//

import UIKit

class ProductViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    var products: [ProductEntity] = []
    var filteredProducts: [ProductEntity] = []
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        products = ProductManager.shared.fetchProducts()
        searchBar.delegate = self
        showProduct(at: currentIndex)
        styleUI()
    }

    func showProduct(at index: Int) {
        let list = isFiltering() ? filteredProducts : products
        guard list.indices.contains(index) else {
            clearLabels()
            return
        }

        let product = list[index]
        nameLabel.text = product.name
        descriptionLabel.text = product.productDescription
        priceLabel.text = "$\(product.price)"
        providerLabel.text = "By: \(product.provider ?? "Unknown")"
    }

    func isFiltering() -> Bool {
        return !(searchBar.text?.isEmpty ?? true)
    }

    func clearLabels() {
        nameLabel.text = ""
        descriptionLabel.text = ""
        priceLabel.text = ""
        providerLabel.text = ""
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        let list = isFiltering() ? filteredProducts : products
        if currentIndex < list.count - 1 {
            currentIndex += 1
            showProduct(at: currentIndex)
        }
    }

    @IBAction func previousTapped(_ sender: UIButton) {
        if currentIndex > 0 {
            currentIndex -= 1
            showProduct(at: currentIndex)
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredProducts = []
        } else {
            filteredProducts = products.filter {
                ($0.name?.localizedCaseInsensitiveContains(searchText) ?? false) ||
                ($0.productDescription?.localizedCaseInsensitiveContains(searchText) ?? false)
            }
        }
        currentIndex = 0
        showProduct(at: currentIndex)
    }
    
    @IBAction func addProductTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showAddProduct", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        products = ProductManager.shared.fetchProducts()
        currentIndex = 0
        showProduct(at: currentIndex)
    }
    
    @IBAction func viewAllTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showSnackList", sender: self)
    }

    func styleUI() {
        view.backgroundColor = UIColor.systemPink.withAlphaComponent(0.1)

        [nameLabel, descriptionLabel, priceLabel, providerLabel].forEach {
            $0?.textColor = .darkGray
            $0?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            $0?.textAlignment = .center
        }

        [nextButton, previousButton].forEach {
            $0?.backgroundColor = UIColor.systemPink
            $0?.setTitleColor(.white, for: .normal)
            $0?.layer.cornerRadius = 10
        }

        searchBar.barTintColor = .white
        searchBar.searchTextField.backgroundColor = UIColor.white
    }
}
