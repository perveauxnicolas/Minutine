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
    
    func createRoutine(day: String,validEatRoutineAM: String, validWashRoutineAM: String,validGetDressedRoutineAM: String,validEatRoutinePM: String,validWashRoutinePM: String,validGetDressedRoutinePM: String) {
        let routine = RoutineEntity(context: managedObjectContext)
        routine.day = day
        routine.validEatRoutineAM = validEatRoutineAM
        routine.validWashRoutineAM = validWashRoutineAM
        routine.validGetDressedRoutineAM = validGetDressedRoutineAM
        routine.validEatRoutinePM = validEatRoutinePM
        routine.validWashRoutinePM = validWashRoutinePM
        routine.validGetDressedRoutinePM = validGetDressedRoutinePM
        coreDataStack.saveContext()
    }

    func deleteRoutine() {
        routines.forEach { managedObjectContext.delete($0) }
        coreDataStack.saveContext()
    }
    
}
