//
//  ResultRoutineViewController.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 27/03/2024.
//

import UIKit

final class ResultRoutineViewController: UIViewController {
    
    // MARK: - Properties
    private var coreDataSetting: CoreDataSetting?
    private var cellSelected: RoutineDay?
    private let listRoutineCell = "listRoutineCell"
    
    // MARK: - Outlets
    @IBOutlet weak var resultRoutineTableView: UITableView!
    
    // MARK: - View life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resultRoutineTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        coreDataFunction()
      //  configureRecipe()
        addRoutine()

    }
    
 /*   @IBAction func ResetButton(_ sender: UIBarButtonItem) {
        coreDataSetting?.deleteAllRecipes()
        resultRoutineTableView.reloadData()
    }*/
    
    
    // MARK: - Privates
    private  func coreDataFunction() {
        coreDataSetting = CoreDataSetting(coreDataStack: CoreDataStack(modelName: "Minutine"))
    }
    
    private func addRoutine() {
  //      guard let label = cellSelected?.routine.label else { return }
     //   guard let ingredients = cellule?.recipe.ingredientLines.joined(separator: "\n" + "- ") else { return }
     //   guard let yield = cellule?.recipe.yield else { return }
     //   let totalTime = Int16(cellule?.recipe.totalTime ?? 0)
     //   guard let image = cellule?.recipe.image else { return }
     //   guard let url = cellule?.recipe.url else { return }
        
      //  coreDataSetting?.createRoutine(validWashRoutine: Bool)
    }
   
    
    
}
   
    // MARK: - UITableViewDataSource
    extension ResultRoutineViewController: UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return coreDataSetting?.routines.count ?? 0
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let listRoutineCell = tableView.dequeueReusableCell(
                withIdentifier: listRoutineCell,
                for: indexPath) as? ResultRoutineTableViewCell else {
                return UITableViewCell()
            }
            let routine = coreDataSetting?.routines[indexPath.row]
            listRoutineCell.routineEntity = routine
            return listRoutineCell
        }
        
  //      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  //          self.cellSelected = coreDataSetting?.routines[indexPath.row]
   //         performSegue(withIdentifier: self.segueToRecipeDetailFavorite, sender: self)
   //     }
    }


extension ResultRoutineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Tu n'as pas encore fait de routine"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return coreDataSetting?.routines.isEmpty ?? true ? 300 : 0
    }
}
// MARK: - Navigation
extension ResultRoutineViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == listRoutineCell {
         //   guard let listRoutineCellVC = segue.destination
         //           as? FavoriteViewController else { return }
         //   listRoutineCellVC.cellule = self.cellSelected
        }
    }
}

    
    

