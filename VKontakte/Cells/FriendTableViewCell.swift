//
//  FriendTableViewCell.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 15.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    

    @IBOutlet private weak var shadowView: UIView? {
        didSet {
            shadowView?.layer.shadowOffset = .zero
            shadowView?.layer.shadowOpacity = 0.75
            shadowView?.layer.shadowRadius = 6
            shadowView?.layer.shadowColor = UIColor.darkGray.cgColor
            shadowView?.backgroundColor = .clear
        }
    }

  
    @IBOutlet private weak var friendImage: UIImageView? {
        didSet {
            friendImage?.contentMode = .scaleToFill
            friendImage?.layer.cornerRadius = (friendImage?.frame.width ?? 60) / 2
            
            friendImage?.layer.borderColor = UIColor.darkGray.cgColor
            friendImage?.layer.borderWidth = 1
        }
    }
    
 
    @IBOutlet private weak var shadowViewContainer: UIView? {
        didSet {
            shadowViewContainer?.layer.shadowColor = UIColor.lightGray.cgColor
            shadowViewContainer?.layer.shadowRadius = 3
            shadowViewContainer?.layer.shadowOpacity = 0.8
            shadowViewContainer?.layer.shadowOffset = .zero
            shadowViewContainer?.backgroundColor = .clear
        }
    }
    

    @IBOutlet private weak var friendName: UILabel? {
        didSet {
            friendName?.font = UIFont.boldSystemFont(ofSize: 20)
            friendName?.textColor = .black
        }
    }
    
    
    // MARK: - Set Friend
    
    func setFriend(friend: Friend) {
        
        self.friendImage?.image = UIImage(named: friend.image)
        self.friendName?.text = friend.name
    }
}
