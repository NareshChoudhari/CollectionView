//
//  imgur.swift
//  CollectionView
//
//  Created by NareshNaidu on 03/07/17.
//  Copyright © 2017 NareshNaidu. All rights reserved.
//

import UIKit

struct Imgur {
    
    private let id: String
    private let link: String
    
    let title: String
    
    init?(json: JSON)    {
        guard let id = json["id"] as? String,
        let title = json["title"] as? String,
        let link = json ["link"] as? String
            else { return nil }
        self.id = id
        self.link = link
        self.title = title
    }
    
    func image(completion: @escaping (UIImage) -> Void) {
        NetworkingSerivce.shared.downloadImage(fromLink: link)  { (image) in
            completion(image)
        }
    }
}
