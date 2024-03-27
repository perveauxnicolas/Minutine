//
//  ResultRoutineTableViewCell.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 27/03/2024.
//

import UIKit

class ResultRoutineTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var jourLabel: UILabel!
    @IBOutlet weak var washAM: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     //   customViewCell(view: recipeImageView)
     //   addShadowTexte(label: titleRecipeLabel )
     //   addShadowTexte(label: ingredientsLabel )
    }
    
    // MARK: - Properties
    var routineEntity: RoutineEntity? {
        didSet {
            
        //    jourLabel.text = RoutineEntity?.title
       //     ingredientsFavoriteLabel.text = recipeEntity?.ingredients
       //     yieldFavoriteLabel.text = String(recipeEntity?.yield ?? 0)
       //     timeFavoriteLabel.text = Int(recipeEntity?.time ?? 0).formatToStringTime
       //     FavoriteImageView.load(urlImageString: recipeEntity?.image ?? "ImageDefault1024x768" + ".jpg")
        }
    }
}
