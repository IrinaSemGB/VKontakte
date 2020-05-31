//
//  Router.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 31.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class Router: NSObject {
    
    let presentationDelegate = PresentationDelegate()
    
    func openApplication() {
        
        guard let viewController = self.getTabBarController() else {
            return
        }
        
        guard let appDelegate = UIApplication.shared.windows.first?.rootViewController else {
            return
        }
        
        viewController.transitioningDelegate = self.presentationDelegate
        appDelegate.present(viewController, animated: true, completion: nil)
    }
    
    
    // MARK: -
    
    private func getTabBarController() -> TabBarController? {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {
            return nil
        }
        viewController.transitioningDelegate = self.presentationDelegate
        return viewController
    }
}
