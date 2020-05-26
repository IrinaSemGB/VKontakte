//
//  LikeAnimator.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 20.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class LikeAnimator {
    
    let container: UIView
    let layoutConstraint: NSLayoutConstraint
    
    init(container: UIView, layoutConstraint: NSLayoutConstraint) {
        
        self.container = container
        self.layoutConstraint = layoutConstraint
    }
    
    
    func animate(completion: @escaping () -> Void) {
        
        self.layoutConstraint.constant = 50
        
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 2,
                       options: .curveLinear,
                       animations: {
                        
                        self.container.layoutIfNeeded()
                        
        }) { (_) in
            
            self.layoutConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3,
                           animations: {
                            
                            self.container.layoutIfNeeded()
                            completion()
            })
        }
    }
}
