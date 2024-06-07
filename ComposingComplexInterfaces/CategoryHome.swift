//
//  CategoryHome.swift
//  ComposingComplexInterfaces
//
//  Created by qsp on 2024/6/6.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData: ModelData
    
    var body: some View {
        NavigationSplitView {
            List {
                modelData.features[0]
                    .image
                    .resizable()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key] ?? [])
                }.listRowInsets(EdgeInsets())
            }.navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }

    }
}

#Preview {
    CategoryHome().environment(ModelData())
}
