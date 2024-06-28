//
//  ProfileSummary.swift
//  WorkingWithUIControls
//
//  Created by qsp on 2024/6/10.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username).bold()
                    .font(.title)
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges").font(.headline)
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day").hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike").grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }.padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack {
                    Text("")
                    HikeView(hike: ModelData().hikes[0])
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default).environment(ModelData())
}
