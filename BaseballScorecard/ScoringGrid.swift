//
//  ScoringGrid.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/13/26.
//

import SwiftUI

struct ScoringGrid: View {
    let rowCount: Int
    let inningCount: Int
    let rowHeight: CGFloat
    let headerHeight: CGFloat
    
    var body: some View {
        Grid(horizontalSpacing: 2, verticalSpacing: 2) {
            GridRow {
                ForEach(1...inningCount, id: \.self) { inning in
                    Text("\(inning)")
                        .frame(width: rowHeight, height: headerHeight)
                        .background(.black)
                        .foregroundStyle(.white)
                }
            }
            
            ForEach(1...rowCount, id: \.self) { row in
                GridRow {
                    ForEach(1...inningCount, id: \.self) { _ in
                        ScoreBoxView(side: rowHeight)
                    }
                }
            }
        }
    }
}

#Preview {
    ScoringGrid(rowCount: 9, inningCount: 9, rowHeight: 90, headerHeight: 30)
}
