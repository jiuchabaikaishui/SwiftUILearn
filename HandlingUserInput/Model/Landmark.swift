//
//  Landmark.swift
//  ListsAndNavigation
//
//  Created by qsp on 2024/5/29.
//

import Foundation
import CoreLocation
import SwiftUI

/// 数据模型
struct Landmark: Decodable, Identifiable {
    let name: String
    let category: String
    let city: String
    let state: String
    let id: Int
    let park: String
    private let coordinates: Coordinates
    private let imageName: String
    var isFavorite: Bool
    
    // 只读属性
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    var image: Image {
        ImageStore.image(name: imageName)
    }
    
    // 类型属性 数据列表
    static let list: [Landmark] = load("landmarkData.json")
}

/// 坐标数据模型
struct Coordinates: Decodable {
    let longitude: Double
    let latitude: Double
}



