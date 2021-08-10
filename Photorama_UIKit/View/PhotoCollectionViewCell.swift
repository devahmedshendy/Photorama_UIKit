//
//  PhotoCollectionViewCell.swift
//  Photorama
//
//  Created by  Ahmed Shendy on 7/29/21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //MARK: - Static Properties
    
    static let reuseIdentifier: String = String(describing: PhotoCollectionViewCell.self)
    
    //MARK: - Methods
    
    func update(displaying image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner.startAnimating()
            imageView.image = nil
        }
    }
}
