//
//  GetimgursResponse.swift
//  CollectionView
//
//  Created by NareshNaidu on 03/07/17.
//  Copyright © 2017 NareshNaidu. All rights reserved.
//

import Foundation

struct GetImgursRespnse {

    let imgurs: [Imgur]
    
    init(json: JSON) throws {
        print(json)
        guard let data = json["data"] as? [JSON] else { throw MyErrorResponse.someError }
        let imgurs = data.map{ Imgur(json: $0) }.flatMap{ $0 }
        self.imgurs = imgurs
    }
}
