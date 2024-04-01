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
    
    // MARK: - Outlets
    @IBOutlet weak var stopButton: UIButton!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
        setupTimerAnimation(timerLayer: timerLayer, timerLayerFond: timerLayerFond)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in   ///  to return to ViewController1 after 5 seconds
            self?.echecRoutine()
        }
    }
    
    // MARK: - Actions
    @IBAction func tapeditsdoneButton(_ sender: Any) {
        getRoutine()
    }
    
    // MARK: - Methods
    func getRoutine() {
        timerSetting.returnSucces(buttonTag: buttonTag ?? 10)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) {
        }
    }
    func echecRoutine () {
        timerSetting.returnFailed(buttonTag: buttonTag ?? 10)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) {
        }
    }
    
}
