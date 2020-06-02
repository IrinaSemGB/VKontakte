//
//  GroupsAnimationControllers.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 02.06.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit


   // MARK: - Push

class CustomGroupsPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        let width = fromVC.view.frame.width
        let height = fromVC.view.frame.height
        
        let initialTranslation = CGAffineTransform(translationX: width / 2 + height / 2, y: -width / 2)
        let initialRotation = CGAffineTransform(rotationAngle: -90 * .pi/180)
          
        transitionContext.containerView.backgroundColor = .white
          
        transitionContext.containerView.addSubview(toVC.view)
        toVC.view.frame = fromVC.view.frame
        toVC.view.transform = initialRotation.concatenating(initialTranslation)

        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                  delay: 0,
                                  options: .calculationModePaced,
                                  animations: {
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.5,
                                                       animations: {
                                                        let translation = CGAffineTransform(translationX: -100 , y: 0)
                                                        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                                                        fromVC.view.transform = scale.concatenating(translation)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.8,
                                                       animations: {
                                                        let translation = CGAffineTransform(translationX: 0 , y: 0)
                                                        let rotation = CGAffineTransform(rotationAngle: 0)
                                                        toVC.view.transform = rotation.concatenating(translation)
                                    })
                                    
          }) { (finished: Bool) in
                if finished && !transitionContext.transitionWasCancelled {
                    fromVC.view.transform = .identity
                }
                if transitionContext.transitionWasCancelled {
                    toVC.view.transform = .identity
                    fromVC.view.transform = .identity
                }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}


    // MARK: - Pop

class CustomGroupsPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
  
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
    
        let width = fromVC.view.frame.width
        let height = fromVC.view.frame.height
    
        let initialTranslation = CGAffineTransform(translationX: -100, y: 0)
        let initialScale = CGAffineTransform(scaleX: 0.8, y: 0.8)
    
        transitionContext.containerView.addSubview(toVC.view)
        transitionContext.containerView.sendSubviewToBack(toVC.view)
        toVC.view.frame = fromVC.view.frame
        toVC.view.transform = initialScale.concatenating(initialTranslation)
    
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.8,
                                                       animations: {
                                                        let translation = CGAffineTransform(translationX: 0, y: 0)
                                                        let scale = CGAffineTransform(scaleX: 1, y: 1)
                                                        toVC.view.transform = scale.concatenating(translation)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.8,
                                                       animations: {
                                                        let translation = CGAffineTransform(translationX: width/2 + height/2, y: -width/2)
                                                        let rotation = CGAffineTransform(rotationAngle: -90 * .pi/180)
                                                        fromVC.view.transform = rotation.concatenating(translation)
                                    })
                                    
        }) { (finished: Bool) in
            
            if (finished && !transitionContext.transitionWasCancelled) {
                toVC.view.transform = .identity
            }
            
            if transitionContext.transitionWasCancelled {
                toVC.view.transform = .identity
                fromVC.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}
