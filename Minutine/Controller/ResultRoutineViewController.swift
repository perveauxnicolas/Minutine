//
//  ResultRoutineViewController.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 27/03/2024.
//

import UIKit

final class ResultRoutineViewController: UIViewController {
    
    // MARK: - Properties
  //  var timerDuration: TimeInterval = 5.0 // Valeur par défaut
    
    private var coreDataSetting: CoreDataSetting?
    private var cellSelected: RoutineDay?
    private let listRoutineCell = "listRoutineCell"
    let timerSetting = TimerSetting()
    
    // MARK: - Outlets
    @IBOutlet weak var resultRoutineTableView: UITableView!
    @IBOutlet weak var durationSegmentedControl: UISegmentedControl!
    
    // MARK: - View life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resultRoutineTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        coreDataFunction()
    }
    
    @IBAction func tapedResetButton(_ sender: UIBarButtonItem) {
       coreDataSetting?.deleteRoutines()
        resultRoutineTableView.reloadData()
    }
   
    @IBAction func durationTimer(_ sender: UISegmentedControl) {
        var timerDuration: TimeInterval = 0.0
        switch sender.selectedSegmentIndex {
        case 0:
            timerDuration = 5.0
        case 1:
            timerDuration = 300.0
        case 2:
            timerDuration = 600.0
        default:
            break
        }
        print("Durée de minuterie sélectionnée : \(timerDuration)")
      // NotificationCenter.default.post(name: Notification.Name("SelectedTimerDuration"), object: nil, userInfo: ["timerDuration": timerDuration])

        saveTimerDuration(timerDuration) // Sauvegarde la nouvelle valeur dans UserDefaults
        // Post notification avec la durée sélectionnée
        NotificationCenter.default.post(name: Notification.Name("SelectedTimerDuration"), object: nil, userInfo: ["timerDuration": timerDuration])
    }
    
    private func saveTimerDuration(_ duration: TimeInterval) {
        UserDefaults.standard.set(duration, forKey: "timerDuration")
    }

    
    // MARK: - Privates
    private  func coreDataFunction() {
        coreDataSetting = CoreDataSetting(coreDataStack: CoreDataStack(modelName: "Minutine"))
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
