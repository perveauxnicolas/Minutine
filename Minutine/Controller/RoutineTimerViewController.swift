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
    
    var originViewControllerAM: MorningRoutineViewController?
    var originViewControllerPM: EveningRoutineViewController?
    var buttonTag: Int?
    
    
    // MARK: - Outlets
    @IBOutlet weak var stopButton: UIButton!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
        setupTimerAnimation(timerLayer: timerLayer, timerLayerFond: timerLayerFond)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in   ///  to return to ViewController1 after 5 seconds
     //       self?.returnFailedToMorningRoutineViewController()
            self?.echecRoutine()
        }
    }
    
    // MARK: - Actions
    @IBAction func tapeditsdoneButton(_ sender: Any) {
               getRoutine()
        
    }
    
    // MARK: - Methods
    
    func getRoutine(){
        timerSetting.returnSucces(buttonTag: buttonTag ?? 10)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) {}
    }
    func echecRoutine (){
    timerSetting.returnFailed(buttonTag: buttonTag ?? 10)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) {} /// Revenir à ViewController1
    }
    
  
    
    
    
    
    
    
    
    /*  func addDay() {
     if myRoutine.day.isEmpty {
     myRoutine.day.append("jour 1")
     } else if myRoutine.day.count < 7 {
     // Si le tableau day contient moins de 7 jours
     let lastDay = myRoutine.day.last! // Récupère le dernier jour ajouté
     let lastDayNumber = Int(lastDay.split(separator: " ")[1])! // Récupère le numéro du dernier jour
     myRoutine.day.append("jour \(lastDayNumber + 1)") // Ajoute le prochain jour
     }
     }*/
    
    func validRoutine(validated: Bool) {
        // Créez une instance de Routine avec une valeur initiale vide pour validWashRoutineAM
        var routine = Routine(day: "", validWashRoutineAM: "", validGetDressedRoutineAM: "", validEatRoutineAM: "", validWashRoutinePM: "", validGetDressedRoutinePM: "", validEatRoutinePM: "")
        // Mettez à jour la variable validWashRoutineAM selon la valeur de validated
        if validated {
            routine.validWashRoutineAM = "Validé"
        } else if routine.validWashRoutineAM.isEmpty {
            routine.validWashRoutineAM = "Validé"
        }
        // Vous pouvez maintenant utiliser la structure Routine mise à jour selon vos besoins
    }
    
    
    
    
  /*  func returnSuccesToMorningRoutineViewController(buttonTag: Int) {
        var routine = Routine(day: "", validWashRoutineAM: "", validGetDressedRoutineAM: "", validEatRoutineAM: "", validWashRoutinePM: "", validGetDressedRoutinePM: "", validEatRoutinePM: "")
        routine.day = "lundi"
        
        if buttonTag == 0 {
            let washButtonGreen = UIImage(named: "washV")
            routine.validWashRoutineAM = "Validé"
            
            originViewControllerAM?.washButton.setImage(washButtonGreen, for: .normal)
            originViewControllerAM?.washButton.isEnabled = false
            
        } else if buttonTag == 1 {
            let getDressedBButtonGreen = UIImage(named: "getDressedV")
            routine.validGetDressedRoutineAM = "Validé"
            
            originViewControllerAM?.getDressedButton.setImage(getDressedBButtonGreen, for: .normal)
            originViewControllerAM?.getDressedButton.isEnabled = false
            
        } else if buttonTag == 2 {
            let eatButtonGreen = UIImage(named: "eatV")
            routine.validEatRoutineAM = "Validé"
            
            
            originViewControllerAM?.eatButton.setImage(eatButtonGreen, for: .normal)
            originViewControllerAM?.eatButton.isEnabled = false
            
        } else if buttonTag == 3 {
            let washButtonGreen = UIImage(named: "washV")
            routine.validWashRoutineAM = "Validé"
            
            originViewControllerPM?.washButton.setImage(washButtonGreen, for: .normal)
            originViewControllerPM?.washButton.isEnabled = false
            
        } else if buttonTag == 4 {
            let getDressedBButtonGreen = UIImage(named: "getDressedV")
            routine.validGetDressedRoutinePM = "Validé"
            
            
            originViewControllerPM?.getDressedButton.setImage(getDressedBButtonGreen, for: .normal)
            originViewControllerPM?.getDressedButton.isEnabled = false
            
        } else if buttonTag == 5 {
            let eatButtonGreen = UIImage(named: "eatV")
            routine.validEatRoutinePM = "Validé"
            
            
            originViewControllerPM?.eatButton.setImage(eatButtonGreen, for: .normal)
            originViewControllerPM?.eatButton.isEnabled = false
        }
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) {}
    } */
    /*
    func returnFailedToMorningRoutineViewController() {
        print("Tag du bouton reçu : \(buttonTag ?? 10)")
        
        if buttonTag == 0 {
            let washButtonRed = UIImage(named: "washR") /// Remplacez "newImage" par le nom de votre nouvelle image
            originViewControllerAM?.washButton.setImage(washButtonRed, for: .normal)
            originViewControllerAM?.washButton.isEnabled = false
            
        } else if buttonTag == 1 {
            let getDressedBButtonRed = UIImage(named: "getDressedR")
            originViewControllerAM?.getDressedButton.setImage(getDressedBButtonRed, for: .normal)
            originViewControllerAM?.getDressedButton.isEnabled = false
            
        } else if buttonTag == 2 {
            let eatButtonRed = UIImage(named: "eatR")
            originViewControllerAM?.eatButton.setImage(eatButtonRed, for: .normal)
            originViewControllerAM?.eatButton.isEnabled = false
            
        } else if buttonTag == 3 {
            let washButtonRed = UIImage(named: "washR")
            originViewControllerPM?.washButton.setImage(washButtonRed, for: .normal)
            originViewControllerPM?.washButton.isEnabled = false
            
        } else if buttonTag == 4 {
            let getDressedBButtonRed = UIImage(named: "getDressedR")
            originViewControllerPM?.getDressedButton.setImage(getDressedBButtonRed, for: .normal)
            originViewControllerPM?.getDressedButton.isEnabled = false
            
        } else if buttonTag == 5 {
            let eatButtonRed = UIImage(named: "eatR")
            originViewControllerPM?.eatButton.setImage(eatButtonRed, for: .normal)
            originViewControllerPM?.eatButton.isEnabled = false
        }
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) {}
    }
    */
    /*
     func  delateScreen () {
     
     let washButtonWhite = UIImage(named: "washB")
     originViewControllerAM?.washButton.setImage(washButtonWhite, for: .normal)
     originViewControllerAM?.washButton.isEnabled = true
     
     navigationController?.popViewController(animated: true)
     dismiss(animated: true) {}
     }
     */
    
    
}
