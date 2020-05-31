//
//  AnimationControllers.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 31.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class OpenAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    let animationDuration: TimeInterval = 0.8
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        var openApplicationButtonFrame: CGRect = CGRect.zero
        
        if let loginFormController = fromVC as? LoginFormController,
            let loginButton = loginFormController.loginButton {
            openApplicationButtonFrame = loginButton.frame
            
        } else if let navigationController = fromVC as? UINavigationController,
            let loginFormController = navigationController.viewControllers.first as? LoginFormController,
            let loginButton = loginFormController.loginButton {
            openApplicationButtonFrame = loginButton.frame
        }
        
        
        transitionContext.containerView.addSubview(toVC.view)
        toVC.view.frame = openApplicationButtonFrame
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       animations: {
                        
                        toVC.view.frame = fromVC.view.bounds
                        
        }) { (finished: Bool) in
            
            fromVC.removeFromParent()
            transitionContext.completeTransition(true)
        }
    }  
}


    // MARK: - CustomPushAnimator

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


    // MARK: - CustomPopAnimator

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
    

   // MARK: - CustomGroupsPushAnimator

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
        
        let initialTranslation = CGAffineTransform(translationX: width/2 + height/2, y: -width/2)
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


    // MARK: - CustomGroupsPopAnimator

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
