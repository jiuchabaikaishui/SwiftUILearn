//
//  InterfacingWithUIKitApp.swift
//  InterfacingWithUIKit
//
//  Created by qsp on 2024/6/27.
//

import SwiftUI

@main
struct InterfacingWithUIKitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(ModelData())
        }
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
