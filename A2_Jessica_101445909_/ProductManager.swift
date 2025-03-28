//
//  ProductManager.swift
//  A2_Jessica_101445909_
//
//  Created by jessica lee on 2025-03-28.
//

import UIKit
import CoreData


class ProductManager {
    static let shared = ProductManager()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func fetchProducts() -> [ProductEntity] {
        let request: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Fetch failed: \(error)")
            return []
        }
    }

    func addProduct(id: String, name: String, description: String, price: Double, provider: String) {
        let product = ProductEntity(context: context)
        product.name = name
        product.productDescription = description
        product.price = price
        product.provider = provider
        saveContext()
    }

    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Save error: \(error)")
        }
    }
}


