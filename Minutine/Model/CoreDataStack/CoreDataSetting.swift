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
    
    /*
    
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
    */
   

   /*
    func saveToCoreData(routineResult: RoutineResult) {
            let coreDataStack = CoreDataStack(modelName: "Minutine")
            let managedContext = coreDataStack.mainContext
            
            for routineDay in routineResult.routineDays {
                let entity = NSEntityDescription.entity(forEntityName: "RoutineEntity", in: managedContext)!
                let routineObject = NSManagedObject(entity: entity, insertInto: managedContext)
                
                let routine = routineDay.routine
                
                routineObject.setValue(routine.day, forKey: "day")
                routineObject.setValue(routine.validWashRoutineAM, forKey: "validWashRoutineAM")
                routineObject.setValue(routine.validGetDressedRoutineAM, forKey: "validGetDressedRoutineAM")
                routineObject.setValue(routine.validEatRoutineAM, forKey: "validEatRoutineAM")
                routineObject.setValue(routine.validWashRoutinePM, forKey: "validWashRoutinePM")
                routineObject.setValue(routine.validGetDressedRoutinePM, forKey: "validGetDressedRoutinePM")
                routineObject.setValue(routine.validEatRoutinePM, forKey: "validEatRoutinePM")
            }
            
            coreDataStack.saveContext()
        }
    */
    
    

