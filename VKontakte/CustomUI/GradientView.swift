//
//  GradientView.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 19.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = UIColor(red: 0.234, green: 0.234, blue: 0.234, alpha: 1) {
        didSet {
            self.updateColors()
        }
    }
    
    @IBInspectable var endColor: UIColor = .clear {
        didSet {
            self.updateColors()
        }
    }
    
    @IBInspectable var startLocation: CGFloat = 0 {
        didSet {
            self.updateLocation()
        }
    }
    
    @IBInspectable var endLocation: CGFloat = 1 {
        didSet {
            self.updateLocation()
        }
    }
    
    @IBInspectable var startPoint: CGPoint = .zero {
        didSet {
            updateStartPoint()
        }
    }
    
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet {
            updateEndPoint()
        }
    }
    
    
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
//    var startColor: UIColor = .white
//    var endColor: UIColor = .black
//    var startLocation: CGFloat = 0
//    var endLocation: CGFloat = 1
//    var startPoint: CGPoint = .zero
//    var endPoint: CGPoint = CGPoint(x: 0, y: 1)
    
    func updateLocation() {
        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
    }
    
    func updateColors() {
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }
    
    func updateStartPoint() {
        self.gradientLayer.startPoint = startPoint
    }
    
    func updateEndPoint() {
        self.gradientLayer.endPoint = endPoint
    }
}
