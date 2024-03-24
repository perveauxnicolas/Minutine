//
//  TimerSetting.swift
//  Minutine
//
//  Created by Perveaux Nicolas on 21/03/2024.
//

import Foundation
import UIKit

class TimerSetting : UIViewController {
    
    // MARK: - Properties
    let timerLayer = CAShapeLayer()
    let basicAnimation =  CABasicAnimation()
    
    
    func getTimerFinish(timerLayer: CAShapeLayer, basicAnimation: CABasicAnimation, completionHandler: @escaping (Bool, RoutineResult?) -> Void) {
        UIView.animate(withDuration: 15, animations: {
         //   self.basicAnimationTimer(timerLayer: timerLayer)
        }, completion: { fini in
            guard fini else{return}
            print("02")
        })
    }
    
    func finishTime (basicAnimation: CABasicAnimation){
        if  timerLayer.strokeEnd == 0 { print("le temps est fini") } else { print(  "le temps n'est pas fini") }
    }
    
    func animationDidStop(anim: CABasicAnimation, finished flag: Bool) {
        if anim.keyPath == "strokeEnd" { print("c'est finiiiiiiii") }
    }
    
    func isValidRoutine() -> Bool {
        if timerLayer.strokeEnd == 1 {
            print("no validé")
            return false
        }
        return true
    }
    /*
    private func validateRoutine() {
        var title: Bool

        if sender.0 == basicAnimation.toValue = 1
{
            title = true
           // score += 1
        } else {
            title = false
           // score -= 1
        }
    }
    */
    
  
}

    /*
     let timeNoFinish = true
     var timeOver = false
     
     if timeOver {
     print("Allons à la plage")
     ｝else {
     print ("Restons coder à l'intérieur")
     }
     */

/*
 func timerFinish(shapeLayer:shapeLayer, completionHandler: @escaping (Bool, RoutineResult?) -> Void) {
 guard let basicAnimationTimer = 1 else { return }
 //   recipeSession.request(url: url) { recipeResult,error  in
 guard let routineResult = routineResult, error == nil else {
 completionHandler (false, routineResult)
 return
 }
 completionHandler(true, routineResult)
 }
 
 }
 */
//validateRoutine

/*
 func Timer(){
 let animator = UIViewPropertyAnimator(duration: 5, curve: .linear) {
 self.shapeLayer.path = circularPath.cgPath
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
 var timer = Bool()
 
 func timerFinish(){
 if timer == true{
 print("c'est ok")
 } else {
 print("c'est fini")
 }
 }*/



