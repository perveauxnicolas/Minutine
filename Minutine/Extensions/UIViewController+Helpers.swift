//
//  UIViewController+Helpers.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 21/03/2024.
//


import UIKit

// MARK: - Extension to manage the ActivityIndicator
extension UIViewController {
    
    func visualTimer( timerLayer: CAShapeLayer,timerLayerFond: CAShapeLayer) {
        let center = view.center//view.center
      //  let center =CGPoint(x: bounds.origin.x + bounds.size.width / 2, y: bounds.origin.y + bounds.size.height / 2)
        let circularPath = UIBezierPath(arcCenter: center, radius: 75, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi-CGFloat.pi/2, clockwise: true)
        
        timerLayerFond.path = circularPath.cgPath
        timerLayerFond.lineWidth = 150
        timerLayerFond.strokeColor = UIColor.red.cgColor
        timerLayerFond.shadowColor = UIColor.lightGray.cgColor
        timerLayerFond.shadowOpacity = 1
        timerLayerFond.shadowRadius = 5
        view.layer.addSublayer(timerLayerFond)
        
        timerLayer.path = circularPath.cgPath
        timerLayer.lineWidth = 150
        timerLayer.strokeColor = UIColor(displayP3Red: 54/255, green: 72/255, blue: 90/255, alpha: 1).cgColor
        timerLayer.shadowColor = UIColor.red.cgColor
        timerLayer.shadowOpacity = 1
        timerLayer.shadowRadius = 10
        timerLayer.strokeEnd = 0
        timerLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(timerLayer)
        //  view.addGestureRecognizer(UITapGestureRecognizer(target: EveningRoutineViewController.self, action: #selector(handleTap)))
    }
    
    func basicAnimationTimer (timerLayer: CAShapeLayer)  {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 30
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        timerLayer.add(basicAnimation, forKey: "basicAnim")
    }
    
    func basicAnimationTimerFinish (shapeLayer: CAShapeLayer) {
        // shapeLayer.strokeEnd = 0
    }
    func buttonHidden(shown: Bool, button1: UIButton,button2: UIButton) {
        button1.isHidden = shown
        button2.isHidden = !shown
    }
    
    
    
    
    enum StateOfTime {
        case timeIsOver
        case timeisInProgress
    }
    // Alert message to user
    func presentAlertTime (typeAlert: StateOfTime) {
        var message: String
        var title: String
        
        switch typeAlert {
        case .timeIsOver:
            title = "Dommage"
            message = "désolé le temps est fini..."
            
        case .timeisInProgress:
            title = "Super"
            message = "Tu as réussi!"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    //   func buttonHidden(button: UIButton) {
    //       button.isHidden = true
    // infoLabel.text = ""
    //    }
    /*
     UIView.animate(withDuration: duration, delay: 0, options: [], animations: {
     self.redSquare.backgroundColor = .green
     }, completion: { finished in
     print("animation finished: \(finished)")
     })
     */
    
    /*
     func basicAnimationTimer (shapeLayer: CAShapeLayer)  { //, completionHandler: @escaping (Bool) -> Void)
     let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
     basicAnimation.toValue = 1
     basicAnimation.duration = 5
     basicAnimation.fillMode = CAMediaTimingFillMode.forwards
     basicAnimation.isRemovedOnCompletion = false
     shapeLayer.add(basicAnimation, forKey: "basicAnim")
     //  completionHandler(true)
     }*/
    /*
     func timer(shapeLayer : CAShapeLayer, circularPath : UIBezierPath){
     let animator = UIViewPropertyAnimator(duration: 5, curve: .linear) {
     shapeLayer.path = circularPath.cgPath
     }
     animator.addCompletion { position in
     if position == .end {
     print("First completion")
     }
     }
     animator.addCompletion { position in
     if position == .end {
     print("Second completion")
     }
     }
     animator.startAnimation()}
     */
    
    /*
     func timerVisuelle(shapeLayer : CAShapeLayer,shapeLayerFond : CAShapeLayer ){
     let center = view.center
     let circularPath = UIBezierPath(arcCenter: center, radius: 75, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi-CGFloat.pi/2, clockwise: true)
     shapeLayer.path = circularPath.cgPath
     shapeLayer.lineWidth = 151
     shapeLayer.strokeColor = UIColor.black.cgColor
     shapeLayer.strokeEnd = 0
     shapeLayer.fillColor = UIColor.clear.cgColor //shapeLayer.lineCap = CAShapeLayerLineCap.round
     
     shapeLayerFond.path = circularPath.cgPath
     shapeLayerFond.lineWidth = 150
     shapeLayerFond.strokeColor = UIColor.red.cgColor
     
     view.layer.addSublayer(shapeLayerFond)
     view.layer.addSublayer(shapeLayer)
     //     view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
     
     }
     
     @objc func handleTap(shapeLayer : CAShapeLayer,shapeLayerFond : CAShapeLayer ) { //  print("Tapping on the screen")
     let basicAnimation =  CABasicAnimation(keyPath: "strokeEnd")
     basicAnimation.toValue = 1
     basicAnimation.duration = 15
     basicAnimation.fillMode = CAMediaTimingFillMode.forwards
     basicAnimation.isRemovedOnCompletion = false
     shapeLayer.add(basicAnimation, forKey: "basicAnim")
     
     }*/
    
    // func getRecipes(shapeLayer: CAShapeLayer, completionHandler: @escaping (Bool) -> Void) {}
    
    /*
     , completion: {(finished:Bool) in
     // the code you put here will be compiled once the animation finishes
     })
     */
}
