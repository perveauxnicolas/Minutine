//
//  UIViewController+Helpers.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 21/03/2024.
//

import UIKit

// MARK: - Extension to manage TimerAnimation

extension UIViewController  {
    
    func setupTimerAnimation( timerLayer: CAShapeLayer,timerLayerFond: CAShapeLayer) {
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 75, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi-CGFloat.pi/2, clockwise: true)
        let circularPathFond = UIBezierPath(arcCenter: center, radius: 75, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi-CGFloat.pi/2, clockwise: true)
        
        timerLayerFond.path = circularPathFond.cgPath
        timerLayerFond.lineWidth = 150
        timerLayerFond.strokeColor = UIColor(displayP3Red: 108/255, green: 192/255, blue: 172/255, alpha: 1).cgColor
        timerLayerFond.shadowColor = UIColor.white.cgColor
        timerLayerFond.shadowOpacity = 1
        timerLayerFond.shadowRadius = 5
        view.layer.addSublayer(timerLayerFond)
        
        timerLayer.path = circularPath.cgPath
        timerLayer.lineWidth = 150
        timerLayer.strokeColor = UIColor(displayP3Red: 40/255, green: 57/255, blue: 80/255, alpha: 1).cgColor
        timerLayer.shadowColor = UIColor.white.cgColor
        timerLayer.shadowOpacity = 1
        timerLayer.shadowRadius = 10
        timerLayer.strokeEnd = 0
        timerLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(timerLayer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 5
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        timerLayer.add(animation, forKey: "timerAnimation")
    }
    
    func resetAllButton(washButton: UIButton, getDressedButton: UIButton, eatButton: UIButton) {
           let washButtonWhite = UIImage(named: "washB")
           washButton.setImage(washButtonWhite, for: .normal)
           washButton.isEnabled = true
           
           let getDressedBButtonWhite = UIImage(named: "getDressedB")
           getDressedButton.setImage(getDressedBButtonWhite, for: .normal)
           getDressedButton.isEnabled = true
           
           let eatButtonWhite = UIImage(named: "eatB")
           eatButton.setImage(eatButtonWhite, for: .normal)
           eatButton.isEnabled = true
       }
    
    
    
}
