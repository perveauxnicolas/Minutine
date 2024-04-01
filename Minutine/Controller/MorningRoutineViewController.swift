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
        timerSetting.timerSettingDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateWashGreenButtonAM), name: Notification.Name("washGreenAM"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateGetGreenButtonAM), name: Notification.Name("getGreenAM"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateEatGreenButtonAM), name: Notification.Name("eatGreenAM"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateWashRedButtonAM), name: Notification.Name("washRedAM"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateGetRedButtonAM), name: Notification.Name("getRedAM"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateEatRedButtonAM), name: Notification.Name("eatRedAM"), object: nil)
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
    
    @IBAction func tapeResetButton(_ sender: UIButton) {
        resetAllButton(washButton: washButton, getDressedButton: getDressedButton, eatButton: eatButton)
    }
    
    // MARK: - Methods
    @objc func didUpdateWashGreenButtonAM() {
        washButton.setImage(UIImage(named: "washV"), for: .normal)
        washButton.isEnabled = false
    }
    @objc func didUpdateGetGreenButtonAM() {
        getDressedButton.setImage(UIImage(named: "getDressedV"), for: .normal)
        getDressedButton.isEnabled = false
    }
    @objc func didUpdateEatGreenButtonAM() {
        eatButton.setImage(UIImage(named: "eatV"), for: .normal)
        eatButton.isEnabled = false
    }
    @objc func didUpdateWashRedButtonAM() {
        washButton.setImage(UIImage(named: "washR"), for: .normal)
        washButton.isEnabled = false
    }
    @objc func didUpdateGetRedButtonAM() {
        getDressedButton.setImage(UIImage(named: "getDressedR"), for: .normal)
        getDressedButton.isEnabled = false
    }
    @objc func didUpdateEatRedButtonAM() {
        eatButton.setImage(UIImage(named: "eatR"), for: .normal)
        eatButton.isEnabled = false
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


