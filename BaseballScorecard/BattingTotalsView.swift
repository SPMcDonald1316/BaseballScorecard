//
//  TotalsGrid.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/13/26.
//

import SwiftUI

struct BattingTotalsView: View {
    let nameColumnWidth: CGFloat
    let cellHeight: CGFloat
    let cellWidth: CGFloat
    let headerHeight: CGFloat
    private let labels = ["AB", "R", "H", "RBI", "BB", "K"]
    @Binding var lineup: [LineupSlot]
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(labels, id: \.self) { label in
                    Text(label)
                        .frame(width: cellWidth, height: headerHeight)
                        .background(.black)
                        .foregroundStyle(.white)
                }
            }
            
            ForEach($lineup) { $slot in
                VStack(spacing: 0) {
                    ForEach($slot.lines) { $line in
                        if !line.name.isEmpty {
                            HStack(spacing: 0) {
                                Text(line.name)
                                    .frame(width: nameColumnWidth, height: cellHeight)
                                TotalsBoxView(
                                    cellHeight: cellHeight,
                                    cellWidth: cellWidth, stat: $line.atbats
                                )
                                TotalsBoxView(
                                    cellHeight: cellHeight,
                                    cellWidth: cellWidth, stat: $line.runs
                                )
                                TotalsBoxView(
                                    cellHeight: cellHeight,
                                    cellWidth: cellWidth, stat: $line.hits
                                )
                                TotalsBoxView(
                                    cellHeight: cellHeight,
                                    cellWidth: cellWidth, stat: $line.runsBattedIn
                                )
                                TotalsBoxView(
                                    cellHeight: cellHeight,
                                    cellWidth: cellWidth, stat: $line.walks
                                )
                                TotalsBoxView(
                                    cellHeight: cellHeight,
                                    cellWidth: cellWidth, stat: $line.strikeouts
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BattingTotalsView(nameColumnWidth: 135, cellHeight: 90, cellWidth: 90, headerHeight: 30, lineup: .constant(
        (0..<9).map { _ in LineupSlot()
         })
    )
}
