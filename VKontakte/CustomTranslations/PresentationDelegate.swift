//
//  PresentationDelegate.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 31.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class PresentationDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    let openAnimationController = OpenAnimationController()
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return self.openAnimationController
    }
}
