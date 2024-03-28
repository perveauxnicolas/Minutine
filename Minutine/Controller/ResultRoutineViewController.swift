//
//  ResultRoutineViewController.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 27/03/2024.
//

import UIKit

final class ResultRoutineViewController: UIViewController {
    
    // MARK: - Properties
    private var coreDataSetting: CoreDataSetting?
    private var cellSelected: RoutineDay?
    private let listRoutineCell = "listRoutineCell"
    let timerSetting = TimerSetting()
    
    
    // MARK: - Outlets
    @IBOutlet weak var resultRoutineTableView: UITableView!
    
    // MARK: - View life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resultRoutineTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        coreDataFunction()
        //  configureRecipe()
        addRoutine()
    }
    
    @IBAction func tapedResetButton(_ sender: UIBarButtonItem) {
        // timerSetting.updateButtonAppearance()
        //   coreDataSetting?.deleteRoutine()
        //   resultRoutineTableView.reloadData()
    }
    
    // MARK: - Privates
    private  func coreDataFunction() {
        coreDataSetting = CoreDataSetting(coreDataStack: CoreDataStack(modelName: "Minutine"))
    }
    
    private func addRoutine() {
        guard let day = cellSelected?.routine.day else {return}
        guard let validEatRoutineAM = cellSelected?.routine.validEatRoutineAM else { return }
        guard let validWashRoutineAM = cellSelected?.routine.validWashRoutineAM else { return }
        guard let validGetDressedRoutineAM = cellSelected?.routine.validGetDressedRoutineAM else { return }
        guard let validEatRoutinePM = cellSelected?.routine.validEatRoutinePM else { return }
        guard let validWashRoutinePM = cellSelected?.routine.validWashRoutinePM else { return }
        guard let validGetDressedRoutinePM = cellSelected?.routine.validGetDressedRoutinePM else { return }
        
        coreDataSetting?.createRoutine(day: day, validEatRoutineAM: validEatRoutineAM, validWashRoutineAM: validWashRoutineAM, validGetDressedRoutineAM: validGetDressedRoutineAM, validEatRoutinePM: validEatRoutinePM, validWashRoutinePM: validWashRoutinePM, validGetDressedRoutinePM: validGetDressedRoutinePM)
    }
}





// MARK: - UITableViewDataSource
extension ResultRoutineViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataSetting?.routines.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listRoutineCell = tableView.dequeueReusableCell(
            withIdentifier: listRoutineCell,
            for: indexPath) as? ResultRoutineTableViewCell else {
            return UITableViewCell()
        }
        let routine = coreDataSetting?.routines[indexPath.row]
        listRoutineCell.routineEntity = routine
        return listRoutineCell
    }
}

extension ResultRoutineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Tu n'as pas encore fait de routine"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return coreDataSetting?.routines.isEmpty ?? true ? 300 : 0
    }
}



/*
 
 // MARK: - EXTENSION
 //Using extension with protocol(Model) to delegate, in order to manage alerts and update the display, to the model
 extension ResultRoutineViewController: ModelDelegate {
 func delegateFunction() {
 }
 
 //  func updateTextView(label: String) {
 //      textView.text = label
 //  }
 }
 */



