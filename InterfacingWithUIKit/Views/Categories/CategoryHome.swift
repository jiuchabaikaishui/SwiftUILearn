//
//  CategoryHome.swift
//  ComposingComplexInterfaces
//
//  Created by qsp on 2024/6/6.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: ModelData().features.map({ FeatureCard(landmark: $0) }))
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key] ?? [])
                }.listRowInsets(EdgeInsets())
            }.listStyle(.inset)
                .navigationTitle("Featured")
                .toolbar(content: {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }).sheet(isPresented: $showingProfile, content: {
                ProfileHost().environment(modelData)
            })
        } detail: {
            Text("Select a Landmark")
        }

    }
}

#Preview {
    CategoryHome().environment(ModelData())
}
