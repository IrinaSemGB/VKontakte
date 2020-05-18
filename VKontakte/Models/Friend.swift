//
//  Friend.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 15.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import Foundation


class Friend {
    
    var name: String
    var image: String
    var photos: [Photo]
    
    init(name: String, image: String, photos: [Photo]) {
        self.name = name
        self.image = image
        self.photos = photos
    }
}

class Photo {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
