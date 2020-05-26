//
//  NewsCollectionViewCell.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 25.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView?
    
    
    func setNewsPhoto(photoNews: PhotoNews) {

        self.newsImageView?.image = UIImage(named: photoNews.name)
        self.layoutIfNeeded()
    }
}
