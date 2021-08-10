//
//  ImageStore.swift
//  Photorama
//
//  Created by  Ahmed Shendy on 7/29/21.
//

import UIKit

class ImageStore {
    
    let cache = NSCache<NSString,UIImage>()
    
    func getImage(forKey key: String) -> UIImage? {
        
        return cache.object(forKey: key as NSString)
    }
    
    func imageURL(forKey key: String) -> URL {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.appendingPathComponent(key)
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
}
