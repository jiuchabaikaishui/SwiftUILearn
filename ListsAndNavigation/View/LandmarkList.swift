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
            List(Landmark.list, id: \.id) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }.navigationTitle(Text("Landmarks"))
        }
    }
}

#Preview {
    LandmarkList()
}
