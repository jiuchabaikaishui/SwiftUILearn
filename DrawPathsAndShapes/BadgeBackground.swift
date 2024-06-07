//
//  BadgeBackground.swift
//  DrawPathsAndShapes
//
//  Created by qsp on 2024/6/4.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path({ path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
                let xScale: CGFloat = 0.832
                let xOffset: CGFloat = (width*(1.0 - xScale))/2.0
                width *= xScale
                
                path.move(to: CGPoint(x: xOffset + width*0.95, y: height*(0.2 + HexagonParameters.adjustment)))
                
                HexagonParameters.points.forEach {
                    path.addLine(to: CGPoint(x: xOffset + width*$0.useWidth.0*$0.xFactors.0, y: height*$0.useHeight.0*$0.yFactors.0))
                    
                    path.addQuadCurve(to: CGPoint(x: xOffset + width*$0.useWidth.1*$0.xFactors.1, y: height*$0.useHeight.1*$0.yFactors.1), control: CGPoint(x: xOffset + width*$0.useWidth.2*$0.xFactors.2, y: height*$0.useHeight.2*$0.yFactors.2))
                }
            }).fill(LinearGradient(colors: [BadgeBackground.gradientStart, BadgeBackground.gradientEnd], startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.6)))
                .aspectRatio(1, contentMode: .fit)
        }
    }
    
    static let gradientStart = Color(red: 239.0/255, green: 120.0/255, blue: 221.0/255)
    static let gradientEnd = Color(red: 239.0/255, green: 172.0/255, blue: 120.0/255)
}

#Preview {
    BadgeBackground()
}
