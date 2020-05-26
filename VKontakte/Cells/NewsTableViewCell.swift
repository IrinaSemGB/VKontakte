//
//  NewsTableViewCell.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 25.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var autorImage: UIImageView? {
        didSet {
            autorImage?.contentMode = .scaleToFill
            autorImage?.layer.cornerRadius = (autorImage?.frame.width ?? 60) / 2
            
            autorImage?.layer.borderColor = UIColor.darkGray.cgColor
            autorImage?.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var autorName: UILabel? {
        didSet {
            autorName?.font = UIFont.boldSystemFont(ofSize: 20)
            autorName?.textAlignment = .left
            autorName?.textColor = .black
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView? 
    
    @IBOutlet weak var time: UILabel? {
        didSet {
            time?.font = UIFont.systemFont(ofSize: 15)
            time?.textAlignment = .left
            time?.textColor = .darkGray
        }
    }
    
    @IBOutlet weak var signature: UILabel? {
        didSet {
            signature?.font = UIFont.systemFont(ofSize: 15)
            signature?.numberOfLines = 2
            signature?.textAlignment = .left
            signature?.textColor = .black
        }
    }
    
    
    func setNews(newsOne: News) {
        
        self.autorImage?.image = UIImage(named: newsOne.autorImage)
        self.autorName?.text = newsOne.autorName
        self.time?.text = newsOne.time
        self.signature?.text = newsOne.signature
    }
    
    
    // MARK: - Like
    
    @IBOutlet weak var likeControl: LikeControl?
    
    @IBAction func likeControlChanged() {
        
    }
    
    
    // MARK: - Repost
    
    @IBOutlet weak var repostControl: RepostControl?
    
    @IBAction func repostControlChanged() {
        
    }
    
    
    // MARK: - Views
    
    @IBOutlet weak var viewControl: ViewControl?
    
    @IBAction func viewControlChanged() {
        print("viewControlChanged")
    }
}



