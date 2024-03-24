//
//  MorningRoutineViewController.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 20/03/2024.
//

import UIKit

class MorningRoutineViewController: UIViewController {
    
    // MARK: - Properties
    private let segueToTimer = "segueToTimer"
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
        self.performSegue(withIdentifier: self.segueToTimer, sender: self)
    }
}

// MARK: - Navigation
extension MorningRoutineViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToTimer {
            //  guard let listRoutineVC = segue.destination as? EveningRoutineViewController else { return }
            //  listRoutineVC.RoutineList = RoutineList
        }
    }
}


