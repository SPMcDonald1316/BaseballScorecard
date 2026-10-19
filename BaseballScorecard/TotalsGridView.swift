//
//  TotalsGrid.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/13/26.
//

import SwiftUI

struct TotalsGridView: View {
    let rowHeight: CGFloat
    let headerHeight: CGFloat
    private let labels = ["AB", "R", "H", "RBI", "BB", "K"]
    @Binding var lineup: [LineupSlot]
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(labels, id: \.self) { label in
                    Text(label)
                        .frame(width: rowHeight / 2, height: headerHeight)
                        .background(.black)
                        .foregroundStyle(.white)
                }
            }
            
            ForEach($lineup) { $slot in
                VStack(spacing: 0) {
                    ForEach($slot.lines) { $line in
                        HStack(spacing: 0) {
                            TotalsBoxView(rowHeight: rowHeight, stat: $line.atbats)
                            TotalsBoxView(rowHeight: rowHeight, stat: $line.runs)
                            TotalsBoxView(rowHeight: rowHeight, stat: $line.hits)
                            TotalsBoxView(rowHeight: rowHeight, stat: $line.runsBattedIn)
                            TotalsBoxView(rowHeight: rowHeight, stat: $line.walks)
                            TotalsBoxView(rowHeight: rowHeight, stat: $line.strikeouts)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TotalsGridView(rowHeight: 90, headerHeight: 30, lineup: .constant(
        (0..<9).map { _ in LineupSlot()
         })
    )
}
