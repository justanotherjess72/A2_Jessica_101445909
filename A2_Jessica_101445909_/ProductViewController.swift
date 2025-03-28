//
//  ProductViewController.swift
//  A2_Jessica_101445909_
//
//  Created by jessica lee on 2025-03-28.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var products: [ProductEntity] = []
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = ProductManager.shared.fetchProducts()
        showProduct(at: currentIndex)
        styleUI()
    }

    func showProduct(at index: Int) {
        guard products.indices.contains(index) else { return }
        let product = products[index]
        nameLabel.text = product.name
        descriptionLabel.text = product.productDescription
        priceLabel.text = "$\(product.price)"
        providerLabel.text = "By: \(product.provider ?? "Unknown")"
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        if currentIndex < products.count - 1 {
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

    func styleUI() {
        view.backgroundColor = UIColor.systemPink.withAlphaComponent(0.1)  // light pink background

        [nameLabel, descriptionLabel, priceLabel, providerLabel].forEach {
            $0?.textColor = .darkGray
            $0?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }

        [nextButton, previousButton].forEach {
            $0?.backgroundColor = UIColor.systemPink
            $0?.setTitleColor(.white, for: .normal)
            $0?.layer.cornerRadius = 10
        }
    }
}
