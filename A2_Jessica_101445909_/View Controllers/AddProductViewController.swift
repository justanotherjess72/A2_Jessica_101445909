//
//  AddProductViewController.swift
//  A2_Jessica_101445909_
//
//  Created by jessica lee on 2025-03-28.
//

import UIKit

class AddProductViewController: UIViewController {

    // IBOutlets

    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var providerField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // UI Styling

    func setupUI() {
        view.backgroundColor = UIColor.systemPink.withAlphaComponent(0.05)

        // Title label
        screenTitleLabel.text = "Add Snack"
        screenTitleLabel.font = UIFont(name: "AvenirNext-Bold", size: 30)
        screenTitleLabel.textColor = .darkGray
        screenTitleLabel.textAlignment = .center

        // Input field styling
        let inputFont = UIFont(name: "AvenirNext-Regular", size: 16)
        [nameField, descriptionField, priceField, providerField].forEach {
            $0?.font = inputFont
            $0?.backgroundColor = UIColor.white
            $0?.layer.cornerRadius = 8
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.systemGray5.cgColor
            $0?.setLeftPaddingPoints(10)
        }

        // Button styling
        [addButton, cancelButton].forEach {
            $0?.layer.cornerRadius = 10
            $0?.backgroundColor = UIColor.systemPink
            $0?.setTitleColor(.white, for: .normal)
            $0?.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
        }
    }

    // Actions

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
            self.dismiss(animated: true)
        }
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }

    func showAlert(_ message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in completion?() })
        present(alert, animated: true)
    }
}

