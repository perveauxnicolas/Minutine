//
//  RoutineResult.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 21/03/2024.
//

import Foundation

    // MARK: - RoutineResult
    struct RoutineResult {
      //  var hasMajority: Bool
        let validWashRoutine: Bool
    //    let validGetDressedRoutine: Bool
    //    let validEatRoutine: Bool
     //   let routineWeek: RoutineWeek
    }

    struct RoutineWeek {
        let mondayRoutine = Bool()
        let tuesdayRoutine = Bool()
        let WednesdayRoutine = Bool()
        let thursdayRoutine = Bool()
        let fridayRoutine = Bool()
        let saturdayRoutine = Bool()
        let sundayRoutine = Bool()
         }

extension RoutineResult {
    enum Status {
        case accepted
        case rejected(String)
    }
    var status: Status {
    //    guard let name = name, name.isEmpty == false else {
    //        return .rejected("Vous n'avez pas indiqué votre nom !")
    //    }
        
        guard validWashRoutine == false else {
            return .rejected("Les mineurs ne sont pas admis.")
        }
        return .accepted
    }
}




/*     let ValidationRoutine : Bool
 let oneDay = Bool
 let image: String?
 let url: String
 let yield: Int
 let ingredientLines: [String]
 let totalTime: Int?
 */


/*
let now = Date()

let english       = DateFormatter()
english.dateStyle = .medium
english.timeStyle = .medium
english.locale    = Locale(identifier: "EN-en")
print(english.string(from: now)) // Jan 20, 2017, 10:29:51 PM
*/
// MARK: - Protocols

  // MARK: - Properties
  
  // MARK: - Methods
  
  // MARK: - View life cycle

  // MARK: - Outlets

  // MARK: - Actions

  // MARK: - Privates

  // MARK: - Navigations
  
  // MARK: - Extensions
