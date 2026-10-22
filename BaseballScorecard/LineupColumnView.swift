//
//  LineupColumnView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/5/26.
//

import SwiftUI

struct LineupColumnView: View {
    @Binding var lineup: [LineupSlot]
    let subRows: Int
    let rowHeight: CGFloat
    let headerHeight: CGFloat
    let nameColumnWidth: CGFloat
    var body: some View {
        VStack(spacing: 0) {
            Text("Player")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: headerHeight)
                .background(.black)
            ForEach($lineup) { $slot in
                VStack(spacing: 0) {
                    ForEach($slot.lines) { $line in
                        TextField("", text: $line.name)
                            .frame(height: rowHeight / CGFloat(subRows))
                            .overlay(Rectangle().stroke(.black, lineWidth: 0.5))
                    }
                }
                .overlay(Rectangle().stroke(.black, lineWidth: 1.5))
            }
            InnTotalsLabelView(side: rowHeight)
                .frame(width: nameColumnWidth, height: rowHeight, alignment: .trailing)
        }
        .frame(width: nameColumnWidth)
    }
}

#Preview {
    LineupColumnView(
        lineup: .constant((0..<9).map { _ in LineupSlot() }),
        subRows: 3,
        rowHeight: 90,
        headerHeight: 30,
        nameColumnWidth: 135
    )
}
