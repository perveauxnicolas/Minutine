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
    private let timerSetting = TimerSetting()
    
    // MARK: - Outlets
    @IBOutlet weak var washButton: UIButton!
    @IBOutlet weak var getDressedButton: UIButton!
    @IBOutlet weak var eatButton: UIButton!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        timerSetting.timerSettingDelegate = self  /// Définir ViewController1 comme délégué du modèle Setting
        // Configurer les images initiales des boutons
           washButton.setImage(UIImage(named: "washB"), for: .normal)
           getDressedButton.setImage(UIImage(named: "getDressedB"), for: .normal)
           eatButton.setImage(UIImage(named: "eatB"), for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func tapeWashButton(_ sender: UIButton) {
        performSegue(withIdentifier: self.segueToTimer, sender: sender.tag)
    }
    
    @IBAction func tapeGetDressedButton(_ sender: UIButton) {
        performSegue(withIdentifier: self.segueToTimer, sender: sender.tag)
    }
    
    @IBAction func tapeEatButton(_ sender: UIButton) {
        performSegue(withIdentifier: self.segueToTimer, sender: sender.tag)
    }
}

// MARK: - Navigation
extension MorningRoutineViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToTimer {
            if let routineTimerVC = segue.destination as? RoutineTimerViewController, let tag = sender as? Int {
                routineTimerVC.buttonTag = tag
            }
        }
    }
}

// MARK: - Delegate
extension MorningRoutineViewController: TimerSettingDelegate {
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


