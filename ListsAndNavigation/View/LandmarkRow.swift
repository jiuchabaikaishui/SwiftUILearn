//
//  LandmarkRow.swift
//  ListsAndNavigation
//
//  Created by QSP on 2022/11/4.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image.resizable().frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: Landmark.list[0])
            LandmarkRow(landmark: Landmark.list[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
