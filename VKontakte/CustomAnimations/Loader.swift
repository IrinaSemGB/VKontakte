//
//  Loader.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 27.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

private enum LoaderAnimationStep {
    case step1
    case step2
    case step3
    case stepEnd
}


class Loader: UIView {
    
    @IBOutlet private weak var firstPoint: UIImageView? {
        didSet {
            firstPoint?.image = UIImage(systemName: "circle.fill")
            firstPoint?.tintColor = UIColor(red: 76 / 255, green: 117 / 255, blue: 163 / 255, alpha: 1)
            firstPoint?.alpha = 0
        }
    }
    
    @IBOutlet private weak var secondPoint: UIImageView? {
        didSet {
            secondPoint?.image = UIImage(systemName: "circle.fill")
            secondPoint?.tintColor = UIColor(red: 76 / 255, green: 117 / 255, blue: 163 / 255, alpha: 1)
            secondPoint?.alpha = 0
        }
    }
    
    @IBOutlet private weak var thirdPoint: UIImageView? {
        didSet {
            thirdPoint?.image = UIImage(systemName: "circle.fill")
            thirdPoint?.tintColor = UIColor(red: 76 / 255, green: 117 / 255, blue: 163 / 255, alpha: 1)
            thirdPoint?.alpha = 0
        }
    }
    
    private var animationStep: LoaderAnimationStep = .step1 {
        didSet {
            self.updateStep()
        }
    }
    
    private let animationDuration: TimeInterval = 0.25
    
    private var isLoading: Bool = false
    
    
    // MARK: - Update
    
    func start() {
        self.isLoading = true
        self.updateStep()
    }
    
    func stop() {
        self.isLoading = false
    }
    
    private func updateStep() {
        
        if false == self.isLoading {
            return
        }
        
        switch self.animationStep {
        case .step1:
            self.animateStep1()
        case .step2:
            self.animateStep2()
        case .step3:
            self.animateStep3()
        case .stepEnd:
            self.animateStepEnd()
        }
    }
    
    // MARK: - Animation
    
    private func animateStep1() {
        UIView.animate(withDuration: self.animationDuration,
                       animations: {
                        self.firstPoint?.alpha = 1
        }) { (finished: Bool) in
            self.animationStep = .step2
        }
    }
    
    private func animateStep2() {
        UIView.animate(withDuration: self.animationDuration,
                       animations: {
                        self.firstPoint?.alpha = 0
                        self.secondPoint?.alpha = 1
        }) { (finished: Bool) in
            self.animationStep = .step3
        }
    }
    
    private func animateStep3() {
        UIView.animate(withDuration: self.animationDuration,
                       animations: {
                        self.secondPoint?.alpha = 0
                        self.thirdPoint?.alpha = 1
        }) { (finished: Bool) in
            self.animationStep = .stepEnd
        }
    }
    
    private func animateStepEnd() {
        UIView.animate(withDuration: self.animationDuration,
                       animations: {
                        self.thirdPoint?.alpha = 0
        }) { (finished: Bool) in
            self.animationStep = .step1
        }
    }
}
