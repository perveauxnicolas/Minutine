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
        performSegue(withIdentifier: self.segueToTimer, sender: sender.tag)
      //  getTimer(sender.tag)
    }
    
    @IBAction func tapeGetDressedButton(_ sender: UIButton) {
        performSegue(withIdentifier: self.segueToTimer, sender: sender.tag)
    }
    
    @IBAction func tapeEatButton(_ sender: UIButton) {
        performSegue(withIdentifier: self.segueToTimer, sender: sender.tag)
    }
    
//    private func getTimer(_ newNumber: Int) {
//        self.performSegue(withIdentifier: self.segueToTimer, sender: self)
//    }
   
    
  
}

// MARK: - Navigation
extension MorningRoutineViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToTimer {
            //  guard let listRoutineVC = segue.destination as? EveningRoutineViewController else { return }
            //  listRoutineVC.RoutineList = RoutineList
            
            if let routineTimerVC = segue.destination as? RoutineTimerViewController, let tag = sender as? Int {
                routineTimerVC.buttonTag = tag
                routineTimerVC.originViewController = self   /// Passer une référence à ViewController1 à ViewController2
            }
        }
    }
}







/*
extension MorningRoutineViewController {
    func updateButtonAVisual() {
        // Mettre à jour le visuel du bouton A ici
        self.washButton.setTitle("Validé", for: .normal)
        self.washButton.backgroundColor = UIColor.green 
    }
}*/
/*
func fonctionALancer(forButton button: Int) {
 // Afficher une boîte de dialogue de confirmation
 let alertController = UIAlertController(title: "Confirmation", message: "Voulez-vous valider ?", preferredStyle: .alert)
 let yesAction = UIAlertAction(title: "Oui", style: .default) { (action) in
     // Mettre à jour le visuel du bouton en fonction de celui qui a été pressé
     if button == 1 {
         self.washButton.setTitle("Validé", for: .normal)
         self.washButton.backgroundColor = UIColor.green // Changez la couleur de fond du bouton si nécessaire
     } else if button == 2 {
         self.getDressedButton.setTitle("Validé", for: .normal)
         self.getDressedButton.backgroundColor = UIColor.green // Changez la couleur de fond du bouton si nécessaire
     }
     // Vous pouvez également effectuer d'autres modifications visuelles ici
 }
 let noAction = UIAlertAction(title: "Non", style: .cancel, handler: nil)
 alertController.addAction(yesAction)
 alertController.addAction(noAction)
 present(alertController, animated: true, completion: nil)
}
 
 /*
     // Instancier le ViewController2 depuis le storyboard
            if let routineTimerVC = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as? RoutineTimerViewController {
                routineTimerVC.buttonTag = tag // Passer le tag du bouton au ViewController2
                navigationController?.pushViewController(routineTimerVC, animated: true) // Effectuer la transition
            }
     */
 
 
 
 
*/
