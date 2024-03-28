//
//  MockCoreDataStack.swift
//  MinutineTests
//
//  Created by Perveaux Nicolas on 28/03/2024.
//

import Minutine
import Foundation
import CoreData

final class MockCoreDataStack: CoreDataStack {
    // MARK: - Initializer
    convenience init() {
        self.init(modelName: "Minutine")
    }
    override init(modelName: String) {
        super.init(modelName: modelName)
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType
        let container = NSPersistentContainer(name: modelName)
        container.persistentStoreDescriptions = [persistentStoreDescription]
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        self.persistentContainer = container
    }
}
