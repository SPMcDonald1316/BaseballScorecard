//
//  ScorecardView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/2/26.
//

import SwiftUI

struct ScorecardView: View {
    let team: String
    // TODO: make lineupCount dynamic (can add slots for more batters)
    // TODO: inningCount moves to GameView (@State, starts at 9, only increases) and is passed down to both team scorecards
    static let lineupCount = 9
    let rowHeight: CGFloat = 75
    let headerHeight: CGFloat = 25
    let nameColumnWidth: CGFloat = 135
    @State private var teamName = ""
    @State private var lineup = Array(repeating: LineupSlot(), count: lineupCount)
    
    var body: some View {
        VStack {
            TextField(team, text: $teamName)
            HStack(spacing: 0) {
                LineupColumnView(
                    lineup: $lineup,
                    subRows: 3,
                    rowHeight: rowHeight,
                    headerHeight: headerHeight,
                    nameColumnWidth: nameColumnWidth
                )
                ScoringGrid(
                    rowCount: lineup.count,
                    inningCount: 9,
                    rowHeight: rowHeight,
                    headerHeight: headerHeight
                )
            }
        }
    }
}

#Preview {
    ScorecardView(team: "Away Team")
}
