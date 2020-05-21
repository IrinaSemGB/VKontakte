//
//  PhotoCollectionViewCell.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 15.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImage: UIImageView? {
        didSet {
            photoImage?.contentMode = .scaleAspectFill
            photoImage?.backgroundColor = .clear
            photoImage?.layer.cornerRadius = 10
            photoImage?.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var isLikedImage: UIImageView? {
        didSet {
            isLikedImage?.image = UIImage(systemName: "heart.fill")
            isLikedImage?.backgroundColor = .clear
            isLikedImage?.tintColor = .white
            isLikedImage?.isHidden = true
        }
    }
    
    @IBOutlet weak var bigLikeImage: UIImageView? {
        didSet {
            bigLikeImage?.image = UIImage(systemName: "heart.fill")
            bigLikeImage?.backgroundColor = .clear
            bigLikeImage?.tintColor = .white
        }
    }
    
    @IBOutlet weak var likeWidthConstraint: NSLayoutConstraint!
    
    
    lazy var likeAnimator = LikeAnimator(container: contentView, layoutConstraint: likeWidthConstraint)
    
    lazy var doubleTapRecognizer: UITapGestureRecognizer = {
        
        let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
        tapRecogniser.numberOfTapsRequired = 2
        
        return tapRecogniser
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImage?.addGestureRecognizer(doubleTapRecognizer)
    }
    
    @objc func didDoubleTap() {
        
        self.likeAnimator.animate {
            
            self.isLikedImage?.isHidden = false
        }
    }
    
    func setPhoto(photo: Photo) {
        self.photoImage?.image = UIImage(named: photo.name)
    }
}
