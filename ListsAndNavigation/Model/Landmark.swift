//
//  Landmark.swift
//  ListsAndNavigation
//
//  Created by qsp on 2024/5/29.
//

import Foundation
import CoreLocation
import SwiftUI

struct Landmark: Decodable {
    let name: String
    let category: String
    let city: String
    let state: String
    let id: Int
    let park: String
    private let coordinates: Coordinates
    private let imageName: String
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    var image: Image {
        ImageStore.image(name: imageName)
    }
    
    static let list: [Landmark] = load("landmarkData.json")
}

struct Coordinates: Decodable {
    let longitude: Double
    let latitude: Double
}



