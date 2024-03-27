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
    let timerSetting = TimerSetting()
   
    var routineResult = [RoutineDay]()
    
    var originViewController: MorningRoutineViewController?
    var buttonTag: Int? /// Variable pour stocker le tag du bouton
    
    // MARK: - Outlets
    @IBOutlet weak var stopButton: UIButton!
  //  @IBOutlet weak var startButton: UIButton!
    //  @IBOutlet weak var timerView: UIView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
        /// Start animation when ViewController2 is loaded
        setupTimerAnimation(timerLayer: timerLayer, timerLayerFond: timerLayerFond)
        /// Schedule to return to ViewController1 after 5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
            self?.returnFailedToMorningRoutineViewController()
        }
    }
    
    // MARK: - Actions
    @IBAction func tapeditsdoneButton(_ sender: Any) {
        returnSuccesToMorningRoutineViewController()
    }
    
    // MARK: - Actions
    func returnFailedToMorningRoutineViewController() {
        print("Tag du bouton reçu : \(buttonTag ?? 10)")
        
        if buttonTag == 0 {
            let washButtonRed = UIImage(named: "washR") /// Remplacez "newImage" par le nom de votre nouvelle image
            routineResult[0].routine.validEatRoutineAM = false
            routineResult[0].routine.day = ["jour 1"]
            
            originViewController?.washButton.setImage(washButtonRed, for: .normal)
            originViewController?.washButton.isEnabled = false
            
        } else if buttonTag == 1 {
            let getDressedBButtonRed = UIImage(named: "getDressedR")
            originViewController?.getDressedButton.setImage(getDressedBButtonRed, for: .normal)
            originViewController?.getDressedButton.isEnabled = false
            
        } else if buttonTag == 2 {
            let eatButtonRed = UIImage(named: "eatR")
            originViewController?.eatButton.setImage(eatButtonRed, for: .normal)
            originViewController?.eatButton.isEnabled = false
        }
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) {}
    }
    
    
    
    
    func returnSuccesToMorningRoutineViewController() {
        if buttonTag == 0 {
            let washButtonGreen = UIImage(named: "washV")
            //  routineResult.validWashRoutine = true
            originViewController?.washButton.setImage(washButtonGreen, for: .normal)
            originViewController?.washButton.isEnabled = false
            
        } else if buttonTag == 1 {
            let getDressedBButtonGreen = UIImage(named: "getDressedV")
            originViewController?.getDressedButton.setImage(getDressedBButtonGreen, for: .normal)
            originViewController?.getDressedButton.isEnabled = false
            
        } else if buttonTag == 2 {
            let eatButtonGreen = UIImage(named: "eatV")
            originViewController?.eatButton.setImage(eatButtonGreen, for: .normal)
            originViewController?.eatButton.isEnabled = false
        }
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) {}
    }
    
}
    
    
    
    
    
    
    
    
    
    /*
    
    
    func goBackToViewController1() {
        /// Revenir à ViewController1
        navigationController?.popViewController(animated: true)
        /// Modifier le visuel du bouton dans ViewController1
        if navigationController?.viewControllers.first is MorningRoutineViewController {
            //  viewController1.updateButtonVisual()
        }
    }
    
 
    
    func fonctionALancer() {
        // Afficher une boîte de dialogue de confirmation
        let alertController = UIAlertController(title: "Confirmation", message: "Voulez-vous valider ?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Oui", style: .default) { (action) in
            // Mettre à jour le visuel du bouton
            self.stopButton.setTitle("Validé", for: .normal)
            self.stopButton.backgroundColor = UIColor.green // Changez la couleur de fond du bouton si nécessaire
            // Vous pouvez également effectuer d'autres modifications visuelles ici
        }
        let noAction = UIAlertAction(title: "Non", style: .cancel, handler: nil)
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        present(alertController, animated: true, completion: nil)
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
    */

    




