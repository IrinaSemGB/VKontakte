//
//  AddGroupTableViewCell.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 13.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class AddGroupTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var imageGroup: UIImageView?
    @IBOutlet private weak var nameGroup: UILabel?
    @IBOutlet private(set) weak var pickImage: UIImageView? {
        didSet {
            pickImage?.image = UIImage(systemName: "checkmark.circle")
            pickImage?.tintColor = .green
            pickImage?.isHidden = true
        }
    }

    
    // MARK: - Set Photo
    
    func setGroup(group: Group) {
        
        self.imageGroup?.image = UIImage(named: group.image)
        self.nameGroup?.text = group.name
    }

}
