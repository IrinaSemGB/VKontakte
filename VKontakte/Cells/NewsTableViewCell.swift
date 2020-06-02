//
//  NewsTableViewCell.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 25.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet private weak var autorImage: UIImageView? {
        didSet {
            autorImage?.contentMode = .scaleToFill
            autorImage?.layer.cornerRadius = (autorImage?.frame.width ?? 60) / 2
            
            autorImage?.layer.borderColor = UIColor.darkGray.cgColor
            autorImage?.layer.borderWidth = 1
        }
    }
    
    @IBOutlet private weak var autorName: UILabel? {
        didSet {
            autorName?.font = UIFont.boldSystemFont(ofSize: 20)
            autorName?.textAlignment = .left
            autorName?.textColor = .black
        }
    }
    
    @IBOutlet private(set) weak var collectionView: UICollectionView?
    
    @IBOutlet private weak var time: UILabel? {
        didSet {
            time?.font = UIFont.systemFont(ofSize: 15)
            time?.textAlignment = .left
            time?.textColor = .darkGray
        }
    }
    
    @IBOutlet private weak var signature: UILabel? {
        didSet {
            signature?.font = UIFont.systemFont(ofSize: 15)
            signature?.numberOfLines = 2
            signature?.textAlignment = .left
            signature?.textColor = .black
            signature?.adjustsFontSizeToFitWidth = true
            signature?.minimumScaleFactor = 0.5
        }
    }
    
    
    func setNews(newsOne: News) {
        
        self.autorImage?.image = UIImage(named: newsOne.autorImage)
        self.autorName?.text = newsOne.autorName
        self.time?.text = newsOne.time
        self.signature?.text = newsOne.signature
    }
    
    
    // MARK: - Like
    
    @IBOutlet private weak var likeControl: LikeControl? {
        didSet {
            likeControl?.backgroundColor = .clear
        }
    }
    
    @IBAction private func likeControlChanged() {
        
    }
    
    
    // MARK: - Repost
    
    @IBOutlet private weak var repostControl: RepostControl? {
        didSet {
            repostControl?.backgroundColor = .clear
        }
    }
    
    @IBAction private func repostControlChanged() {
        
    }
    
    
    // MARK: - Views
    
    @IBOutlet private weak var viewControl: ViewControl? {
        didSet {
            viewControl?.backgroundColor = .clear
        }
    }
    
    @IBAction private func viewControlChanged() {
        
    }
    
    
    // MARK: - Prepare
    
    override func prepareForReuse() {
        self.collectionView?.alpha = 0
    }
}



