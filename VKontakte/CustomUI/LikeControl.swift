//
//  LikeControl.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 26.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class LikeControl: UIControl {
    
    @IBOutlet private weak var likeImage: UIImageView? {
        didSet {
            likeImage?.image = UIImage(systemName: "suit.heart")
            likeImage?.contentMode = .scaleAspectFit
            likeImage?.tintColor = .darkGray
        }
    }
    
    @IBOutlet private weak var counterLabel: UILabel? {
        didSet {
            counterLabel?.text = "156"
            counterLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            counterLabel?.textAlignment = .left
            counterLabel?.textColor = .darkGray
            counterLabel?.adjustsFontSizeToFitWidth = true
            counterLabel?.minimumScaleFactor = 0.5
        }
    }


    private var isLiked: Bool = false {
        didSet {
            self.update()
            self.sendActions(for: .valueChanged)
        }
    }
    
    private var counter: Int = 157
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customInit()
    }
    
    private func customInit() {
        
        self.addGesture()
        self.update()
    }
    
    
    // MARK: - Actions
    
    private func addGesture() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction(tap: UITapGestureRecognizer) {
        self.isLiked = !self.isLiked
        self.animateLike()
    }
    
    
    // MARK: - Update
    
    private func update() {
        
        self.updateLikeImageView()
        self.updateCounterLabel()
    }
    
    
    private func updateLikeImageView() {
        
        let like = UIImage(systemName: "suit.heart.fill")
        let unlike = UIImage(systemName: "suit.heart")
        
        let image = self.isLiked ? like : unlike
        self.likeImage?.image = image
        
        let tintColor = self.isLiked ? UIColor.red : UIColor.darkGray
        self.likeImage?.tintColor = tintColor
    }
    
    
    private func updateCounterLabel() {
        
        let textColor = self.isLiked ? UIColor.red : UIColor.darkGray
        self.counterLabel?.textColor = textColor
        
        if self.isLiked {
            self.counter += 1
        } else {
            self.counter -= 1
        }
        self.counterLabel?.text = "\(self.counter)"
    }
    
    
    // MARK: - Animation
    
    private func animateLike() {
        
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.5
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 1
        animation.duration = 0.25
        animation.beginTime = CACurrentMediaTime()
        animation.fillMode = CAMediaTimingFillMode.backwards
      
        self.likeImage?.layer.add(animation, forKey: nil)
    }
}
