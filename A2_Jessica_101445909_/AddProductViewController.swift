//
//  AddProductViewController.swift
//  A2_Jessica_101445909_
//
//  Created by jessica lee on 2025-03-28.
//

import UIKit

class AddProductViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var providerField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemPink.withAlphaComponent(0.05)
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard
            let name = nameField.text, !name.isEmpty,
            let desc = descriptionField.text, !desc.isEmpty,
            let priceText = priceField.text, let price = Double(priceText),
            let provider = providerField.text, !provider.isEmpty
        else {
            showAlert("All fields are required and price must be a number.")
            return
        }

        ProductManager.shared.addProduct(
            id: UUID().uuidString,
            name: name,
            description: desc,
            price: price,
            provider: provider
        )

        showAlert("Snack added!") {
            self.clearFields()
        }
    }

    func showAlert(_ message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in completion?() })
        present(alert, animated: true)
    }

    func clearFields() {
        nameField.text = ""
        descriptionField.text = ""
        priceField.text = ""
        providerField.text = ""
    }
}

