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
    @IBOutlet weak var washAMLabel: UILabel!
    @IBOutlet weak var washPMLabel: UILabel!
    @IBOutlet weak var getDressAMLabel: UILabel!
    @IBOutlet weak var getDressPMLabel: UILabel!
    @IBOutlet weak var eatAMLabel: UILabel!
    @IBOutlet weak var eatPMLabel: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customViewCell(view: viewCell)
    }
    
    // MARK: - Properties
    var routineEntity: RoutineEntity? {
        didSet {
            jourLabel.text = routineEntity?.day
            washAMLabel.text = routineEntity?.validWashRoutineAM
            washPMLabel.text = routineEntity?.validWashRoutinePM
            getDressAMLabel.text = routineEntity?.validGetDressedRoutineAM
            getDressPMLabel.text = routineEntity?.validGetDressedRoutinePM
            eatAMLabel.text = routineEntity?.validEatRoutineAM
            eatPMLabel.text = routineEntity?.validEatRoutinePM
        }
    }
}
