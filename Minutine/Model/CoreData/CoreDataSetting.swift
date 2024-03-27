//
//  CoreDataSetting.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 21/03/2024.
//

import Foundation
import CoreData

final class CoreDataSetting {
    
    
    // MARK: - Properties
    private let coreDataStack: CoreDataStack
    private let managedObjectContext: NSManagedObjectContext
    
    var routines: [RoutineEntity] {
        let request: NSFetchRequest<RoutineEntity> = RoutineEntity.fetchRequest()
        guard let routines = try? managedObjectContext.fetch(request) else { return [] }
        return routines
    }
    
    // MARK: - Initializer
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
        self.managedObjectContext = coreDataStack.mainContext
    }
    
    // MARK: - Manage Task Entity
    
    func createRoutine(validWashRoutine: Bool) {
  //      let routine = RoutineEntity(context: managedObjectContext)
//        routine.validWashRoutineAM = true
     //   routine.validGetDressedRoutineAM = true
     //   routine.validEatRoutineAM = true
        
        coreDataStack.saveContext()
     /*   recipe.ingredients = ingredients
        recipe.time = time
        recipe.url = url*/
    }
    
    func deleteRoutine() {
        routines.forEach { managedObjectContext.delete($0) }
        coreDataStack.saveContext()
    }
    
}
