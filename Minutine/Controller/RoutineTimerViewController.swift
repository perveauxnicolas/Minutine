//
//  MorningRoutineTimerViewController.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 20/03/2024.
//

import UIKit



class RoutineTimerViewController: UIViewController {
    
    // MARK: - Properties
    private let timerLayer = CAShapeLayer()
    private let timerLayerFond = CAShapeLayer()
    let timerSetting = TimerSetting()
    var buttonTag: Int?
    var timerDuration: TimeInterval =  5.0

    
    // MARK: - Outlets
    @IBOutlet weak var stopButton: UIButton!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleSelectedTimerDuration(_:)), name: Notification.Name("SelectedTimerDuration"), object: nil)
        if let savedTimerDuration = loadTimerDuration() {
            timerDuration = savedTimerDuration
        }

        view.backgroundColor = UIColor(displayP3Red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
        setupTimerAnimation(timerLayer: timerLayer, timerLayerFond: timerLayerFond, timerDuration: timerDuration)
        DispatchQueue.main.asyncAfter(deadline: .now() + timerDuration) { [weak self] in
            self?.echecRoutine()
        }
    }
    
    // MARK: - Actions
    @IBAction func tapeditsdoneButton(_ sender: Any) {
        getRoutine()
    }
    
    // MARK: - Methods
    private func getRoutine() {
        timerSetting.returnSucces(buttonTag: buttonTag ?? 10)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) {
        }
    }
    
    private func echecRoutine () {
        timerSetting.returnFailed(buttonTag: buttonTag ?? 10)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) {
        }
    }
    
    private func loadTimerDuration() -> TimeInterval? {
        return UserDefaults.standard.value(forKey: "timerDuration") as? TimeInterval
    }
    
    @objc func handleSelectedTimerDuration(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let timerDuration = userInfo["timerDuration"] as? TimeInterval else {
            return
        }
        self.timerDuration = timerDuration
    }
}
