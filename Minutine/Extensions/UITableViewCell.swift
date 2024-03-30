//
//  UITableViewCell.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 30/03/2024.
//

import UIKit

// MARK: - Extension to custom views of TableViewCell
extension UITableViewCell {
    func customViewCell(view: UIView) {
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 2.0
    }
}
