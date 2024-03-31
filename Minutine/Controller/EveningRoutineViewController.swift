//
//  EveningRoutineViewController.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 20/03/2024.
//

import UIKit

class EveningRoutineViewController: UIViewController {
    
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
        timerSetting.timerSettingDelegate = self
    }
    
    // MARK: - Actions
    @IBAction func tapeWashButton(_ sender: UIButton) {
        performSegue(withIdentifier: self.segueToTimer2, sender: sender.tag)
    }
    
    @IBAction func tapeGetDressedButton(_ sender: UIButton) {
        performSegue(withIdentifier: self.segueToTimer2, sender: sender.tag)
    }
    
    @IBAction func tapeEatButton(_ sender: UIButton) {
        performSegue(withIdentifier: self.segueToTimer2, sender: sender.tag)
    }
}

// MARK: - Navigation
extension EveningRoutineViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToTimer2 {
            if let routineTimerVC2 = segue.destination as? RoutineTimerViewController, let tag = sender as? Int {
                routineTimerVC2.buttonTag = tag
            }
        }
    }
}

extension EveningRoutineViewController: TimerSettingDelegate {
    func didUpdateWashButton(image: UIImage?) {
        washButton.setImage(image, for: .normal)
        washButton.isEnabled = false
    }
    func didUpdateGetDressedButton(image: UIImage?) {
        getDressedButton.setImage(image, for: .normal)
        getDressedButton.isEnabled = false
    }
    func didUpdateEatButton(image: UIImage?) {
        eatButton.setImage(image, for: .normal)
        eatButton.isEnabled = false
    }
}
