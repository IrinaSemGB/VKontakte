//
//  GroupTableViewCell.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 14.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var imageGroup: UIImageView?
    @IBOutlet weak var nameGroup: UILabel?
    
    func setGroup(group: Group) {
        
        self.imageGroup?.image = UIImage(named: group.image)
        self.nameGroup?.text = group.name
    }
}
