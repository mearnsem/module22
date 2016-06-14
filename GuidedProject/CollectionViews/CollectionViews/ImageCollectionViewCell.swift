//
//  ImageCollectionViewCell.swift
//  CollectionViews
//
//  Created by Emily Mearns on 6/14/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func updateWith(image: UIImage) {
        imageView.image = image
    }
    
}
