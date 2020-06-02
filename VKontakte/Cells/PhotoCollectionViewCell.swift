//
//  PhotoCollectionViewCell.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 15.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var photoImage: UIImageView? {
        didSet {
            photoImage?.contentMode = .scaleAspectFill
            photoImage?.backgroundColor = .clear
            photoImage?.layer.cornerRadius = 10
            photoImage?.layer.masksToBounds = true
        }
    }
    
    @IBOutlet private weak var isLikedImage: UIImageView? {
        didSet {
            isLikedImage?.image = UIImage(systemName: "heart.fill")
            isLikedImage?.backgroundColor = .clear
            isLikedImage?.tintColor = .white
            isLikedImage?.isHidden = true
        }
    }
    
    @IBOutlet private weak var bigLikeImage: UIImageView? {
        didSet {
            bigLikeImage?.image = UIImage(systemName: "heart.fill")
            bigLikeImage?.backgroundColor = .clear
            bigLikeImage?.tintColor = .white
        }
    }
    
    @IBOutlet private weak var likeWidthConstraint: NSLayoutConstraint!
    
    
    // MARK: - Like Animator
    
    private lazy var likeAnimator = LikeAnimator(container: contentView, layoutConstraint: likeWidthConstraint)
    
    private lazy var doubleTapRecognizer: UITapGestureRecognizer = {
        
        let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
        tapRecogniser.numberOfTapsRequired = 2
        
        return tapRecogniser
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImage?.addGestureRecognizer(doubleTapRecognizer)
    }
    
    
    @objc private func didDoubleTap() {
        
        self.likeAnimator.animate {
            self.isLikedImage?.isHidden = false
        }
    }
    
    
    // MARK: - Set Photo
    
    func setPhoto(photo: Photo) {
        self.photoImage?.image = UIImage(named: photo.name)
    }
}
