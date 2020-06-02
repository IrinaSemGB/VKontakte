//
//  RepostControl.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 26.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class RepostControl: UIControl {
    
    @IBOutlet private weak var repostImageView: UIImageView? {
        didSet {
            repostImageView?.image = UIImage(systemName: "arrowshape.turn.up.right")
            repostImageView?.contentMode = .scaleAspectFit
            repostImageView?.tintColor = .darkGray
        }
    }
    
    @IBOutlet private weak var counterLabel: UILabel? {
        didSet {
            counterLabel?.text = "65"
            counterLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            counterLabel?.textAlignment = .left
            counterLabel?.textColor = .darkGray
            counterLabel?.adjustsFontSizeToFitWidth = true
            counterLabel?.minimumScaleFactor = 0.5
        }
    }
    
    private var isReposted: Bool = false {
        didSet {
            self.update()
            self.sendActions(for: .valueChanged)
        }
    }
    
    private var counter: Int = 66
    
    
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
        
        self.addGestures()
        self.update()
    }
    
    
    // MARK: - Actions
    
    private func addGestures() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction(tap: UITapGestureRecognizer) {
        self.isReposted = !self.isReposted
    }
    
    
    // MARK: - Update
    
    private func update() {
        
        self.updateRepostImageView()
        self.updateCounterLabel()
    }
    
    private func updateRepostImageView() {
        
        let repost = UIImage(systemName: "arrowshape.turn.up.right.fill")
        let unrepost = UIImage(systemName: "arrowshape.turn.up.right")
        
        let image = self.isReposted ? repost : unrepost
        self.repostImageView?.image = image
    }
    
    private func updateCounterLabel() {
        
        if self.isReposted {
            self.counter += 1
        } else {
            self.counter -= 1
        }
        self.counterLabel?.text = "\(self.counter)"
    }
}
