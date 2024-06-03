//
//  LandmarkDetail.swift
//  ListsAndNavigation
//
//  Created by qsp on 2024/5/29.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate).edgesIgnoringSafeArea(.top).frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
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
    LandmarkDetail(landmark: Landmark.list[0])
}
