//
//  AddGroupTableViewCell.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 13.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class AddGroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageGroup: UIImageView?
    @IBOutlet weak var nameGroup: UILabel?

    func setGroup(group: Group) {
        
        self.imageGroup?.image = UIImage(named: group.image)
        self.nameGroup?.text = group.name
    }

}
