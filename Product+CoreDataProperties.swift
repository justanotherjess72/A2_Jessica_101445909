//
//  Product+CoreDataProperties.swift
//  A2_Jessica_101445909_
//
//  Created by jessica lee on 2025-03-28.
//
//

import Foundation
import CoreData


extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var productDescription: String?
    @NSManaged public var price: Double
    @NSManaged public var name: String?
    @NSManaged public var provider: String?

}

extension ProductEntity : Identifiable {

}
