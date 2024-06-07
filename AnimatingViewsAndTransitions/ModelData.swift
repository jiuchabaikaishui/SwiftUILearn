//
//  ModelData.swift
//  AnimatingViewsAndTransitions
//
//  Created by qsp on 2024/6/5.
//

import Foundation

@Observable
class ModelData {
    var hikes: [Hike] = load("hikeData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    guard let path = Bundle.main.url(forResource: filename, withExtension: nil),
       let data = try? Data(contentsOf: path),
       let result = try? JSONDecoder().decode(T.self, from: data) else {
        fatalError("数据加载失败！")
    }
    
    return result
}
