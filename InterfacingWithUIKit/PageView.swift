//
//  PageView.swift
//  InterfacingWithUIKit
//
//  Created by qsp on 2024/6/27.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(18 * pages.count))
                .padding(.trailing)
        }.aspectRatio(3/2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map({ FeatureCard(landmark: $0) }))
}
