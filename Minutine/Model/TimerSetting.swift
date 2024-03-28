//
//  TimerSetting.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 21/03/2024.
//

import Foundation
import UIKit



class TimerSetting : UIViewController {
    
    
    // MARK: - Properties
 //   let timerLayer = CAShapeLayer()
 //   let basicAnimation =  CABasicAnimation()
    
 //   var routineDay = [RoutineDay]()
    //  var originViewControllerAM: MorningRoutineViewController?
    //  var originViewControllerPM: EveningRoutineViewController?
    
    // MARK: - Methods
    
    
    
    
   
    /*
     func validRoutine() {
     
     var validGetDressedRoutineAMValue = "" // Valeur par défaut pour validGetDressedRoutineAM
     var validEatRoutinePMValue = "échec" // Valeur par défaut pour validEatRoutinePM
     
     // Vérifie si validGetDressedRoutineAM a déjà une valeur
     if let existingValidGetDressedRoutineAM = routineDay.routine.validGetDressedRoutineAM, !existingValidGetDressedRoutineAM.isEmpty {
     // Si c'est le cas, conserve la valeur existante
     validGetDressedRoutineAMValue = existingValidGetDressedRoutineAM
     }
     
     // Vérifie si validEatRoutinePM a déjà une valeur
     if let existingValidEatRoutinePM = routineDay.routine.validEatRoutinePM, !existingValidEatRoutinePM.isEmpty {
     // Si c'est le cas, conserve la valeur existante
     validEatRoutinePMValue = existingValidEatRoutinePM
     }
     
     // Créer une nouvelle instance de Routine avec validWashRoutineAM mis à "Validé" et les autres valeurs inchangées
     let routine = Routine(day: "jour 1",
     validWashRoutineAM: "Validé",
     validGetDressedRoutineAM: validGetDressedRoutineAMValue,
     validEatRoutineAM: "",
     validWashRoutinePM: "",
     validGetDressedRoutinePM: "",
     validEatRoutinePM: validEatRoutinePMValue)
     
     // Créer une instance de RoutineDay avec la nouvelle instance de Routine
     let routineDay = RoutineDay(routine: routine)
     
     // Créer une instance de RoutineResult avec la RoutineDay
     let routineResult = RoutineResult(routineDays: [routineDay])
     
     // Utilisation de routineResult...
     }
     
     
     
     */
}
      
    
  /*
    func  delateScreen (){
    
    let washButtonWhite = UIImage(named: "washB")
    originViewControllerAM?.washButton.setImage(washButtonWhite, for: .normal)
    originViewControllerAM?.washButton.isEnabled = true
    
    }
    */
    
    
    
    
    


/*
 func validRoutine() {
        // Créez une instance de RoutineResult avec des valeurs de test
        var routineResult = RoutineResult(routineDays: [
            RoutineDay(routine: Routine(day: "Monday",
                                        validWashRoutineAM: "",
                                        validGetDressedRoutineAM: "",
                                        validEatRoutineAM: "",
                                        validWashRoutinePM: "",
                                        validGetDressedRoutinePM: "",
                                        validEatRoutinePM: ""))
        ])
        
        // Vérifiez et mettez à jour les valeurs dans la structure Routine
        if routineResult.routineDays.first?.routine.validWashRoutineAM.isEmpty ?? true {
            routineResult.routineDays.first?.routine.validWashRoutineAM = "Validé"
        }
        if routineResult.routineDays.first?.routine.validGetDressedRoutineAM.isEmpty ?? true {
            routineResult.routineDays.first?.routine.validGetDressedRoutineAM = "Validé"
        }
        if routineResult.routineDays.first?.routine.validEatRoutineAM.isEmpty ?? true {
            routineResult.routineDays.first?.routine.validEatRoutineAM = "Validé"
        }
        if routineResult.routineDays.first?.routine.validWashRoutinePM.isEmpty ?? true {
            routineResult.routineDays.first?.routine.validWashRoutinePM = "Validé"
        }
        if routineResult.routineDays.first?.routine.validGetDressedRoutinePM.isEmpty ?? true {
            routineResult.routineDays.first?.routine.validGetDressedRoutinePM = "Validé"
        }
        if routineResult.routineDays.first?.routine.validEatRoutinePM.isEmpty ?? true {
            routineResult.routineDays.first?.routine.validEatRoutinePM = "Validé"
        }
        
        // Vous pouvez maintenant utiliser routineResult mis à jour selon vos besoins
    }
}
 
 */
