//
//  ViewControl.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 26.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class ViewControl: UIControl {
    
    @IBOutlet private weak var viewImageView: UIImageView? {
        didSet {
            viewImageView?.image = UIImage(systemName: "eye")
            viewImageView?.contentMode = .scaleAspectFit
            viewImageView?.tintColor = .lightGray
        }
    }
    
    @IBOutlet private weak var counterLabel: UILabel? {
        didSet {
            counterLabel?.text = "529"
            counterLabel?.font = UIFont.systemFont(ofSize: 15)
            counterLabel?.textAlignment = .left
            counterLabel?.textColor = .lightGray
            counterLabel?.adjustsFontSizeToFitWidth = true
            counterLabel?.minimumScaleFactor = 0.5
        }
    }
    
    private var isViewed: Bool = false {
        didSet {
            self.update()
            self.sendActions(for: .valueChanged)
        }
    }
    
    private var counter: Int = 530
    
    
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
        self.isViewed = !self.isViewed
    }
    
    
    // MARK: - Update
    
    private func update() {
        
        self.updateViewImageView()
        self.updateCounterLabel()
    }
    
    private func updateViewImageView() {
        
        let viewed = UIImage(systemName: "eye.fill")
        let notViewed = UIImage(systemName: "eye")
        
        let image = self.isViewed ? viewed : notViewed
        self.viewImageView?.image = image
    }
    
    private func updateCounterLabel() {
        
        if self.isViewed {
            self.counter += 1
        } else {
            self.counter -= 1
        }
        self.counterLabel?.text = "\(self.counter)"
    }
}
