//
//  PhotoCollectionViewCell.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 15.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImage: UIImageView?
    
    
    func setPhoto(photo: Photo) {
        self.photoImage?.image = UIImage(named: photo.name)
    }
}
