//
//  Badge.swift
//  DrawPathsAndShapes
//
//  Created by qsp on 2024/6/4.
//

import SwiftUI

struct Badge: View {
    var badgeSysbols: some View {
        ForEach(0..<8) { i in
            RotatedBadgeSymbol(angle: Angle(degrees: Double(i*45)))
        }.opacity(0.5)
        
    }
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSysbols.scaleEffect(1.0/4, anchor: .top)
                    .position(x: geometry.size.width/2, y: (3.0/4)*geometry.size.height)
            }
        }.scaledToFit()
    }
}

#Preview {
    Badge()
}
