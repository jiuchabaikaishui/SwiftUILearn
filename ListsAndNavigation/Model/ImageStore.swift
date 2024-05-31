//
//  ImageStore.swift
//  ListsAndNavigation
//
//  Created by qsp on 2024/5/29.
//

import Foundation
import SwiftUI

final class ImageStore {
    // 缓存
    private static var images = [String: CGImage]()
    private static var scale: CGFloat = 2.0
    
    private static func loadImage(name: String) -> CGImage {
        guard
            let path = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imgSource = CGImageSourceCreateWithURL(path as CFURL, nil),
            let img = CGImageSourceCreateImageAtIndex(imgSource, 0, nil)
        else { fatalError("图片加载失败！") }
        
        return img
    }
    
    static func image(name: String) -> Image {
        var img = images[name] ?? loadImage(name: name)
        images[name] = img
        
        return Image(img, scale: scale, label: Text(name))
    }
}
