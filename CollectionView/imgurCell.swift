//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by NareshNaidu on 03/07/17.
//  Copyright © 2017 NareshNaidu. All rights reserved.
//

import UIKit

class imgurCell: UICollectionViewCell {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with imgur: Imgur) {
        labelText.text = imgur.title
        imgur.image { (image) in
            self.imageView.image = image
        }
    }
}
