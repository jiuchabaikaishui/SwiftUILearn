//
//  ProfileHost.swift
//  WorkingWithUIControls
//
//  Created by qsp on 2024/6/10.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear(perform: {
                        draftProfile = modelData.profile
                    })
                    .onDisappear(perform: {
                        modelData.profile = draftProfile
                    })
            }
        }.padding()
    }
}

#Preview {
    ProfileHost().environment(ModelData())
}
