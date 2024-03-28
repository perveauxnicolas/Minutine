//
//  RoutineResult.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 21/03/2024.
//

import Foundation

// MARK: - RoutineResult
struct RoutineResult {
    var routineDays : [RoutineDay]
}
// MARK: - RoutineDay
struct RoutineDay {
    var routine: Routine
}
// MARK: - RoutineDay
struct Routine {
    var day: String
    var validWashRoutineAM: String
    var validGetDressedRoutineAM: String
    var validEatRoutineAM: String
    var validWashRoutinePM: String
    var validGetDressedRoutinePM: String
    var validEatRoutinePM: String
}

