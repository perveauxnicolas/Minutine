//
//  MorningRoutineTimerViewController.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 20/03/2024.
//

import UIKit

class MorningRoutineTimerViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 75, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi-CGFloat.pi/2, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 150
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        //shapeLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc func handleTap() { //  print("Tapping on the screen")
        let basicAnimation =  CABasicAnimation(keyPath: "strokeEnd")
            basicAnimation.toValue = 1
        basicAnimation.duration = 15
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnim")
    }
    
    
    
    
    
    
    
}

