//
//  GroupTableViewCell.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 14.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet private weak var imageGroup: UIImageView?
    @IBOutlet private weak var nameGroup: UILabel?
    
    
    // MARK: - Set Photo
    
    func setGroup(group: Group) {
        
        self.imageGroup?.image = UIImage(named: group.image)
        self.nameGroup?.text = group.name
    }
}
