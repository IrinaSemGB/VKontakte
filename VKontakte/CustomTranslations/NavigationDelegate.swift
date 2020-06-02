//
//  NavigationDelegate.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 31.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit


// MARK: - Friends CustomNavigationController

class OpenNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .none:
            break
        case .push:
            return OpenAnimationController()
        case .pop:
            return nil
        @unknown default:
            fatalError("fatalError")
        }
        return nil
    }
}


// MARK: - Friends CustomNavigationController

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .none:
            break
        case .push:
            return CustomPushAnimator()
        case .pop:
            return CustomPophAnimator()
        @unknown default:
            fatalError("fatalError")
        }
        return nil
    }
}


// MARK: - Groups CustomGroupsNavigationController

class CustomGroupsNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .none:
            break
        case .push:
            return CustomGroupsPushAnimator()
        case .pop:
            return CustomGroupsPopAnimator()
        @unknown default:
            fatalError("fatalError")
        }
        return nil
    }
}
