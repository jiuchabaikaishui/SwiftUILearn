//
//  LandmarkDetail.swift
//  ListsAndNavigation
//
//  Created by qsp on 2024/5/29.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userdata: UserData
    var landmarksIndex: Int {
        userdata.landmarks.firstIndex(where: { $0.id == landmark.id }) ?? 0
    }
    
    var landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate).edgesIgnoringSafeArea(.top).frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    Button(action: {
                        userdata.landmarks[landmarksIndex].isFavorite.toggle()
                    }, label: {
                        if userdata.landmarks[landmarksIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundStyle(.gray)
                        }
                    })
                }
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                }
            }
            .padding()
            Spacer()
        }.navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

#Preview {
    LandmarkDetail(landmark: Landmark.list[0]).environmentObject(UserData())
}
