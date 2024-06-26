//
//  TimerSetting.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 21/03/2024.
//

import Foundation
import UIKit

protocol TimerSettingDelegate: AnyObject {
    func didUpdateWashButton(image: UIImage?)
    func didUpdateGetDressedButton(image: UIImage?)
    func didUpdateEatButton(image: UIImage?)
}

class TimerSetting  {
    
    // MARK: - Properties
    weak var timerSettingDelegate: TimerSettingDelegate?
    static var dayCounter = 1
    static var routine = Routine(day: "", validWashRoutineAM: "", validGetDressedRoutineAM: "", validEatRoutineAM: "", validWashRoutinePM: "", validGetDressedRoutinePM: "", validEatRoutinePM: "")
    let coreDataSetting = CoreDataSetting(coreDataStack: CoreDataStack(modelName: "Minutine"))
    
    // MARK: - Methods
    func dayChoose (){
        if TimerSetting.routine.day.isEmpty {
            TimerSetting.routine.day = "jour \(TimerSetting.dayCounter)"
            TimerSetting.dayCounter += 1
            if TimerSetting.dayCounter > 7 {
                TimerSetting.dayCounter = 1
            }
        }
    }
    
    func returnSucces(buttonTag: Int) {
        dayChoose()
        
        if buttonTag == 0 {
            let washButtonGreen = UIImage(named: "washV")
            if TimerSetting.routine.validWashRoutineAM.isEmpty {
                TimerSetting.routine.validWashRoutineAM =  "Validé"
            }
            NotificationCenter.default.post(name: Notification.Name("washGreenAM"), object: nil)
            timerSettingDelegate?.didUpdateWashButton(image: washButtonGreen)
            
        } else if buttonTag == 1 {
            let getDressedBButtonGreen = UIImage(named: "getDressedV")
            if TimerSetting.routine.validGetDressedRoutineAM.isEmpty {
                TimerSetting.routine.validGetDressedRoutineAM = "Validé"
            }
            NotificationCenter.default.post(name: Notification.Name("getGreenAM"), object: nil)
            timerSettingDelegate?.didUpdateGetDressedButton(image: getDressedBButtonGreen)
            
        } else if buttonTag == 2 {
            let eatButtonGreen = UIImage(named: "eatV")
            if TimerSetting.routine.validEatRoutineAM.isEmpty {
                TimerSetting.routine.validEatRoutineAM = "Validé"
            }
            NotificationCenter.default.post(name: Notification.Name("eatGreenAM"), object: nil)
            timerSettingDelegate?.didUpdateEatButton(image: eatButtonGreen)
            
        } else if buttonTag == 3 {
            let washButtonGreen = UIImage(named: "washV")
            if TimerSetting.routine.validWashRoutinePM.isEmpty {
                TimerSetting.routine.validWashRoutinePM = "Validé"
            }
            NotificationCenter.default.post(name: Notification.Name("washGreenPM"), object: nil)
            timerSettingDelegate?.didUpdateWashButton(image: washButtonGreen)
            
        } else if buttonTag == 4 {
            let getDressedBButtonGreen = UIImage(named: "getDressedV")
            if TimerSetting.routine.validGetDressedRoutinePM.isEmpty {
                TimerSetting.routine.validGetDressedRoutinePM = "Validé"
            }
            NotificationCenter.default.post(name: Notification.Name("getGreenPM"), object: nil)
            timerSettingDelegate?.didUpdateGetDressedButton(image: getDressedBButtonGreen)
            
        } else if buttonTag == 5 {
            let eatButtonGreen = UIImage(named: "eatV")
            if TimerSetting.routine.validEatRoutinePM.isEmpty {
                TimerSetting.routine.validEatRoutinePM = "Validé"
            }
            NotificationCenter.default.post(name: Notification.Name("eatGreenPM"), object: nil)
            timerSettingDelegate?.didUpdateEatButton(image: eatButtonGreen)
        }
        
        let routineDay = RoutineDay(routine: TimerSetting.routine)
        let routineResult = RoutineResult(routineDays: [routineDay])
        
        if TimerSetting.routine.isFullyFilled() { 
            coreDataSetting.saveToCoreData(routineResult: routineResult)
            TimerSetting.routine = Routine(day: "", validWashRoutineAM: "", validGetDressedRoutineAM: "", validEatRoutineAM: "", validWashRoutinePM: "", validGetDressedRoutinePM: "", validEatRoutinePM: "")
        }
    }
    
    func returnFailed(buttonTag: Int) {
        dayChoose()
        if buttonTag == 0 {
            let washButtonRed = UIImage(named: "washR")
            if TimerSetting.routine.validWashRoutineAM.isEmpty {
                TimerSetting.routine.validWashRoutineAM =  "échec"
            }
            NotificationCenter.default.post(name: Notification.Name("washRedAM"), object: nil)
            timerSettingDelegate?.didUpdateWashButton(image: washButtonRed)
            
        } else if buttonTag == 1 {
            let getDressedBButtonRed = UIImage(named: "getDressedR")
            if TimerSetting.routine.validGetDressedRoutineAM.isEmpty {
                TimerSetting.routine.validGetDressedRoutineAM = "échec"
            }
            NotificationCenter.default.post(name: Notification.Name("getRedAM"), object: nil)
            timerSettingDelegate?.didUpdateGetDressedButton(image: getDressedBButtonRed)
            
        } else if buttonTag == 2 {
            let eatButtonRed = UIImage(named: "eatR")
            if TimerSetting.routine.validEatRoutineAM.isEmpty {
                TimerSetting.routine.validEatRoutineAM = "échec"
            }
            NotificationCenter.default.post(name: Notification.Name("eatRedAM"), object: nil)
            timerSettingDelegate?.didUpdateEatButton(image: eatButtonRed)
            
        } else if buttonTag == 3 {
            let washButtonRed = UIImage(named: "washR")
            if TimerSetting.routine.validWashRoutinePM.isEmpty {
                TimerSetting.routine.validWashRoutinePM = "échec"
            }
            NotificationCenter.default.post(name: Notification.Name("washRedPM"), object: nil)
            timerSettingDelegate?.didUpdateWashButton(image: washButtonRed)
            
        } else if buttonTag == 4 {
            let getDressedBButtonRed = UIImage(named: "getDressedR")
            if TimerSetting.routine.validGetDressedRoutinePM.isEmpty {
                TimerSetting.routine.validGetDressedRoutinePM = "échec"
            }
            NotificationCenter.default.post(name: Notification.Name("getRedPM"), object: nil)
            timerSettingDelegate?.didUpdateGetDressedButton(image: getDressedBButtonRed)
            
        } else if buttonTag == 5 {
            let eatButtonRed = UIImage(named: "eatR")
            if TimerSetting.routine.validEatRoutinePM.isEmpty {
                TimerSetting.routine.validEatRoutinePM = "échec"
            }
            NotificationCenter.default.post(name: Notification.Name("eatRedPM"), object: nil)
            timerSettingDelegate?.didUpdateEatButton(image: eatButtonRed)
                }
        
        let routineDay = RoutineDay(routine: TimerSetting.routine)
        let routineResult = RoutineResult(routineDays: [routineDay])
        
        if TimerSetting.routine.isFullyFilled() {
            coreDataSetting.saveToCoreData(routineResult: routineResult)
            TimerSetting.routine = Routine(day: "", validWashRoutineAM: "", validGetDressedRoutineAM: "", validEatRoutineAM: "", validWashRoutinePM: "", validGetDressedRoutinePM: "", validEatRoutinePM: "")
        }
    }
}

extension Routine { /// Extension pour vérifier si tous les champs de Routine sont remplis
    func isFullyFilled() -> Bool {
        return !day.isEmpty && !validWashRoutineAM.isEmpty && !validGetDressedRoutineAM.isEmpty && !validEatRoutineAM.isEmpty && !validWashRoutinePM.isEmpty && !validGetDressedRoutinePM.isEmpty && !validEatRoutinePM.isEmpty
    }
}

