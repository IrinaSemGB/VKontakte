//
//  TabBarController.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 31.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarDesigne()
    }
    
    private func tabBarDesigne() {
        
        tabBar.isTranslucent = true
        tabBar.alpha = 0.95
        
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .darkGray
        
        tabBar.barTintColor = UIColor.white
        tabBar.barStyle = .default
        
        let bgColor = UIColor.black
        let bgView = UIView(frame: CGRect.init(x: 0, y: 0, width: tabBar.frame.width, height: tabBar.frame.height))
        bgView.backgroundColor = bgColor
        tabBar.insertSubview(bgView, at: 0)
    }
}

