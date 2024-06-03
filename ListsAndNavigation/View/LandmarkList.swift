//
//  LandmarkList.swift
//  ListsAndNavigation
//
//  Created by qsp on 2024/5/29.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(Landmark.list) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }.navigationTitle(Text("Landmarks"))
        }
    }
}

#Preview {
    ForEach(["iPhone SE 3rd generation", "iPhone 15", "iPhone 15 Plus"], id: \.self) { deviceName in
        LandmarkList().previewDevice(PreviewDevice(rawValue: deviceName))
    }
}
