//
//  Photo.swift
//  Photorama
//
//  Created by  Ahmed Shendy on 7/29/21.
//

import Foundation

struct Photo: Codable {
    
    //MARK: - Properties
    
    let title: String
    let remoteURL: URL?
    let photoID: String
    let dateTaken: Date
    
    enum CodingKeys: String, CodingKey {
        case title
        case remoteURL = "url_z"
        case photoID = "id"
        case dateTaken = "datetaken"
    }
}

//MARK: - Equatable extension

extension Photo: Equatable {
    static func ==(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.photoID == rhs.photoID
    }
}
