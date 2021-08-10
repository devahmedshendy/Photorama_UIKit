//
//  PhotoDataSource.swift
//  Photorama
//
//  Created by  Ahmed Shendy on 7/29/21.
//

import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource {
    
    //MARK: - Properties
    
    var photos = [Photo]()
    
    //MARK: - DataSource Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        cell.update(displaying: nil)
        
        return cell
    }
}
