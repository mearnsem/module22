//
//  ImageCollectionViewController.swift
//  CollectionViews
//
//  Created by Emily Mearns on 6/14/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

private let reuseIdentifier = "imageCell"

class ImageCollectionViewController: UICollectionViewController {
    
    let picturesArray = ["0", "1", "2", "3", "4", "5"]

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picturesArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? ImageCollectionViewCell
    
        let image = UIImage(named: picturesArray[indexPath.item])
        cell?.updateWith(image ?? UIImage())
        
        return cell ?? ImageCollectionViewCell()
    }
    
    

}
