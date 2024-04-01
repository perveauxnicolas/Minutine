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
    private let timerSetting = TimerSetting()
    
    // MARK: - Outlets
    @IBOutlet weak var washButton: UIButton!
    @IBOutlet weak var getDressedButton: UIButton!
    @IBOutlet weak var eatButton: UIButton!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        timerSetting.timerSettingDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateWashGreenButtonPM), name: Notification.Name("washGreenPM"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateGetGreenButtonPM), name: Notification.Name("getGreenPM"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateEatGreenButtonPM), name: Notification.Name("eatGreenPM"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateWashRedButtonPM), name: Notification.Name("washRedPM"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateGetRedButtonPM), name: Notification.Name("getRedPM"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateEatRedButtonPM), name: Notification.Name("eatRedPM"), object: nil)
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
    
    @IBAction func tapeResetButton(_ sender: UIButton) {
        resetAllButton(washButton: washButton, getDressedButton: getDressedButton, eatButton: eatButton)
    }
    
    // MARK: - Methods
    @objc func didUpdateWashGreenButtonPM() {
        washButton.setImage(UIImage(named: "washV"), for: .normal)
        washButton.isEnabled = false
    }
    @objc func didUpdateGetGreenButtonPM() {
        getDressedButton.setImage(UIImage(named: "getDressedV"), for: .normal)
        getDressedButton.isEnabled = false
    }
    @objc func didUpdateEatGreenButtonPM() {
        eatButton.setImage(UIImage(named: "eatV"), for: .normal)
        eatButton.isEnabled = false
    }
    @objc func didUpdateWashRedButtonPM() {
        washButton.setImage(UIImage(named: "washR"), for: .normal)
        washButton.isEnabled = false
    }
    @objc func didUpdateGetRedButtonPM() {
        getDressedButton.setImage(UIImage(named: "getDressedR"), for: .normal)
        getDressedButton.isEnabled = false
    }
    @objc func didUpdateEatRedButtonPM() {
        eatButton.setImage(UIImage(named: "eatR"), for: .normal)
        eatButton.isEnabled = false
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
