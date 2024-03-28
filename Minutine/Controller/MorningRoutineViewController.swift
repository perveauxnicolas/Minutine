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
                routineTimerVC.originViewControllerAM = self   /// Passer une référence à ViewController1 à ViewController2
            }
        }
    }
}
