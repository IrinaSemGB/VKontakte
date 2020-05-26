//
//  News.swift
//  VKontakte
//
//  Created by Ирина Семячкина on 25.05.2020.
//  Copyright © 2020 Ирина Семячкина. All rights reserved.
//

import UIKit

class News {
    
    var autorImage: String
    var autorName: String
    var time: String
    var photo: [PhotoNews]
    var signature: String
    
    init(autorImage: String, autorName: String, time: String, photo: [PhotoNews], signature: String) {
        self.autorImage = autorImage
        self.autorName = autorName
        self.time = time
        self.photo = photo
        self.signature = signature
    }
}

class PhotoNews {

    var name: String

    init(name: String) {
        self.name = name
    }
}

