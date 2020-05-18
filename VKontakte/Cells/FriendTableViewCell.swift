//
//  FriendTableViewCell.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 15.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendImage: UIImageView?
    @IBOutlet weak var friendName: UILabel?
    
    
    func setFriend(friend: Friend) {
        
        self.friendImage?.image = UIImage(named: friend.image)
        self.friendName?.text = friend.name
    }
}
