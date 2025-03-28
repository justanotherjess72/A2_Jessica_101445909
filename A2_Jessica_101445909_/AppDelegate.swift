//
//  AppDelegate.swift
//  A2_Jessica_101445909_
//
//  Created by jessica lee on 2025-03-28.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Seed 10 snack products on first launch
        if !UserDefaults.standard.bool(forKey: "seeded") {
            let snacks = [
                ("Pocky", "Chocolate-dipped biscuit sticks", 2.99, "Glico"),
                ("Doritos", "Nacho cheese flavored chips", 3.49, "Frito-Lay"),
                ("Haribo Goldbears", "Gummy bear candy", 1.99, "Haribo"),
                ("Takis", "Hot chili pepper & lime chips", 3.29, "Barcel"),
                ("Oreos", "Classic sandwich cookies", 2.49, "Nabisco"),
                ("Cheez-It", "Baked cheese crackers", 2.99, "Kellogg’s"),
                ("Hi-Chew", "Fruit-flavored chewy candy", 1.89, "Morinaga"),
                ("Skittles", "Fruit-flavored candy", 2.19, "Mars"),
                ("Pop Tarts", "Frosted strawberry toaster pastry", 3.99, "Kellogg’s"),
                ("Kinder Bueno", "Hazelnut chocolate bar", 1.79, "Ferrero")
            ]

            for snack in snacks {
                ProductManager.shared.addProduct(
                    id: UUID().uuidString,
                    name: snack.0,
                    description: snack.1,
                    price: snack.2,
                    provider: snack.3
                )
            }

            UserDefaults.standard.set(true, forKey: "seeded")
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "A2_Jessica_101445909_")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

