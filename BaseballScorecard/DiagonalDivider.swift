//
//  DividerDiagonal.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/22/26.
//

import SwiftUI

struct DiagonalDivider: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}
