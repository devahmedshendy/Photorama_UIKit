//
//  ViewController.swift
//  Photorama
//
//  Created by  Ahmed Shendy on 7/28/21.
//

import UIKit

class PhotosViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak private var collectionView: UICollectionView!
    
    //MARK: - Properties
    
    var store: PhotoStore!
    var photoDataSource: PhotoDataSource!
    
    //MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        
        fetchInterestingPhotos()
    }
    
    //MARK: - Methods
    
    func fetchInterestingPhotos() {
        store.fetchInterestingPhotos(completion: handleFetchPhotoCompletion(result:))
    }
    
    func fetchRecentPhotos() {
        store.fetchRecentPhotos(completion: handleFetchPhotoCompletion(result:))
    }
    
    private func handleFetchPhotoCompletion(result: Result<[Photo], Error>) {
        switch result {
        case let .success(photos):            
            self.photoDataSource.photos = photos
            
        case let .failure(error):
            print("Error fetching interesting photos: \(error)")
            self.photoDataSource.photos.removeAll()
        }
        
        collectionView.reloadSections(IndexSet(integer: 0))
    }

    //MARK: - Segue Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showPhotoSegue":
            if let selectedIndexPath = self.collectionView.indexPathsForSelectedItems?.first {
                let photo = photoDataSource.photos[selectedIndexPath.row]
                
                let destinationVC = segue.destination as! PhotoInfoViewController
                destinationVC.store = store
                destinationVC.photo = photo
            }
            
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }

}

//MARK: - Collection View Delegate

extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let photo = photoDataSource.photos[indexPath.row]
        
        store.fetchImage(for: photo) {
            (result) in
            guard let photoIndex = self.photoDataSource.photos.firstIndex(of: photo),
                  case let .success(image) = result else {
                return
            }
            let photoIndexPath = IndexPath(item: photoIndex, section: 0)
            
            if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell {
                cell.update(displaying: image)
            }
        }
    }
}
