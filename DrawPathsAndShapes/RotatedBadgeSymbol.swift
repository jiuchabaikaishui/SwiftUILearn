//
//  RotatedBadgeSymbol.swift
//  DrawPathsAndShapes
//
//  Created by qsp on 2024/6/4.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol().padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 10))
}
