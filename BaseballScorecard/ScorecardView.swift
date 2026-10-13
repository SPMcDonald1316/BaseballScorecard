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
    static let lineupCount = 9
    let rowHeight: CGFloat = 90
    let headerHeight: CGFloat = 30
    @State private var teamName = ""
    @State private var lineup = Array(repeating: LineupSlot(), count: lineupCount)
    
    var body: some View {
        TextField(team, text: $teamName)
        LineupColumnView(
            lineup: $lineup,
            subRows: 3,
            rowHeight: rowHeight,
            headerHeight: headerHeight
        )
    }
}

#Preview {
    ScorecardView(team: "Away Team")
}
