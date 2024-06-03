//
//  LandmarkList.swift
//  ListsAndNavigation
//
//  Created by qsp on 2024/5/29.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userdata: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userdata.showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                
                ForEach(userdata.landmarks) { landmark in
                    if !userdata.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }.navigationTitle(Text("Landmarks"))
        }
    }
}

#Preview {
    LandmarkList().environmentObject(UserData())
//    ForEach(["iPhone SE 3rd generation", "iPhone 15", "iPhone 15 Plus"], id: \.self) { deviceName in
//    }
}
