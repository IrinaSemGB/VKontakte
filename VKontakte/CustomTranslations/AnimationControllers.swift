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
