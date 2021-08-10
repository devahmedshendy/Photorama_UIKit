//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by  Ahmed Shendy on 7/29/21.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet var imageView: UIImageView!
    
    //MARK: - Properties
    
    var store: PhotoStore!
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    //MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()

        store.fetchImage(for: photo) {
            (result) in
            switch result {
            case let .success(image):
                self.imageView.image = image
                
            case let .failure(error):
                print("Error fetching image for photo: \(error)")
            }
            
        }
    }

}
