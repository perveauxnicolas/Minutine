//
//  MorningRoutineTimerViewController.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 20/03/2024.
//

import UIKit

class RoutineTimerViewController: UIViewController {
    
    // MARK: - Properties
    let timerLayer = CAShapeLayer()
    let timerLayerFond = CAShapeLayer()
   // let timerSetting = TimerSetting()
    let basicAnimation = CABasicAnimation()
    let timerSetting = TimerSetting()

    
    // MARK: - Outlets
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        visualTimer(timerLayer: timerLayer, timerLayerFond: timerLayerFond)
        view.backgroundColor = UIColor(displayP3Red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
    }
    
    // MARK: - Actions
    @IBAction func TapStartButton(_ sender: UIButton) {
        // self.buttonHidden(shown: true, button1: self.startButton, button2: self.stopButton)
        self.buttonHidden(shown: true, button1: self.startButton, button2: self.stopButton)
        UIView.animate(withDuration: 30, delay: 0, animations: {
            self.basicAnimationTimer(timerLayer: self.timerLayer)
      //  }, completion: nil)
        }, completion: { fini in
            guard fini else {return}
            print("02")
           // self.dismiss(animated: true) {}
        })
        print("02")

        
    }
    
    @IBAction func tapeStopButton(_ sender: Any) {
        dismiss(animated: true) {
            let routineResult = self.createPetObject()
            self.checkPetStatus(routineResult)
        }
    }
    
    private func checkPetStatus(_ routineResult: RoutineResult) {
        switch routineResult.status {
        case .accepted:
            print("accepte")
          //  performSegue(withIdentifier: segueToTimer, sender: pet)
        case .rejected(_):
            print("reject")
        }
    }
    private func createPetObject() -> RoutineResult {
        let validWashRoutine = true
        return RoutineResult(validWashRoutine: validWashRoutine)
    }
    
    func timerIsFinish () {
        //  timerSetting.animationDidStop(anim: basicAnimation, finished: true)
        print("Routine pas validé")
    }
    
    
    
    
    
}







/*
 func timer(){
 let animator = UIViewPropertyAnimator(duration: 5, curve: .linear) {
 self.shapeLayer.path = circularPath.cgPath
 }
 animator.addCompletion { position in
 if position == .end {
 print("First completion")
 }
 }
 animator.addCompletion { position in
 if position == .end {
 print("Second completion")
 }
 }
 animator.startAnimation()}
 */


