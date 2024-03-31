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
    
    func saveToCoreData(routineResult: RoutineResult) {
        let managedContext = coreDataStack.mainContext
        
        for routineDay in routineResult.routineDays {
            let routineEntity = RoutineEntity(context: managedContext)
            let routine = routineDay.routine
            routineEntity.day = routine.day
            routineEntity.validWashRoutineAM = routine.validWashRoutineAM
            routineEntity.validGetDressedRoutineAM = routine.validGetDressedRoutineAM
            routineEntity.validEatRoutineAM = routine.validEatRoutineAM
            routineEntity.validWashRoutinePM = routine.validWashRoutinePM
            routineEntity.validGetDressedRoutinePM = routine.validGetDressedRoutinePM
            routineEntity.validEatRoutinePM = routine.validEatRoutinePM
        }
        coreDataStack.saveContext()
    }
    
    func deleteRoutines() {
        routines.forEach { managedObjectContext.delete($0) }
        coreDataStack.saveContext()
    }
}

