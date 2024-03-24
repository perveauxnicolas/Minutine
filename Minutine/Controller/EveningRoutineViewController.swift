//
//  EveningRoutineViewController.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 20/03/2024.
//

import UIKit

class EveningRoutineViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: - Properties
    private let segueToTimer2 = "segueToTimer2"
    let timerSetting = TimerSetting()
    
    
    // MARK: - Outlets
    @IBOutlet weak var washButton: UIButton!
    @IBOutlet weak var getDressedButton: UIButton!
    @IBOutlet weak var eatButton: UIButton!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func tapeWashButton(_ sender: UIButton) {
        getTimer()
    }
    
    @IBAction func tapeGetDressedButton(_ sender: UIButton) {
        // simpleCalc.addNewNumber(sender.tag)
        getTimer()
    }
    
    @IBAction func tapeEatButton(_ sender: UIButton) {
        getTimer()
    }
    
    private func getTimer() {
        self.performSegue(withIdentifier: self.segueToTimer2, sender: self)
    }
}

// MARK: - Navigation
extension EveningRoutineViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToTimer2 {
            //  guard let listRoutineVC = segue.destination as? EveningRoutineViewController else { return }
            //  listRoutineVC.RoutineList = RoutineList
        }
    }
}
