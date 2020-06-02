//
//  FrendsAnimationControllers.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 02.06.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit


    // MARK: - Push

class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        transitionContext.containerView.addSubview(toVC.view)
        toVC.view.frame = fromVC.view.frame
        toVC.view.transform = CGAffineTransform(translationX: fromVC.view.frame.width, y: 0)
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                           let translation = CGAffineTransform(translationX: -200, y: 0)
                                                           let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                                                           fromVC.view.transform = translation.concatenating(scale)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.2,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                           let translation = CGAffineTransform(translationX: fromVC.view.frame.width / 2, y: 0)
                                                           let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                                                           toVC.view.transform = translation.concatenating(scale)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.6,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                           toVC.view.transform = .identity
                                    })
                                    
        }) { (finished: Bool) in
            
            if finished && !transitionContext.transitionWasCancelled {
                fromVC.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}


    // MARK: - Pop

class CustomPophAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        transitionContext.containerView.addSubview(toVC.view)
        transitionContext.containerView.sendSubviewToBack(toVC.view)
        
        toVC.view.frame = fromVC.view.frame
        
        let translation = CGAffineTransform(translationX: -200, y: 0)
        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        toVC.view.transform = translation.concatenating(scale)
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                        relativeDuration: 0.4,
                                                        animations: {
                                                            let translation = CGAffineTransform(translationX: fromVC.view.frame.width / 2, y: 0)
                                                            let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                                                            fromVC.view.transform = translation.concatenating(scale)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.4,
                                                        relativeDuration: 0.4,
                                                        animations: {
                                                            fromVC.view.transform = CGAffineTransform(translationX: fromVC.view.frame.width, y: 0)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.25,
                                                        relativeDuration: 0.75,
                                                        animations: {
                                                            toVC.view.transform = .identity
                                    })
                                        
                                        
        }) { (finished: Bool) in
                
            if finished && !transitionContext.transitionWasCancelled {
                fromVC.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                toVC.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}
