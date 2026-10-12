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
    @State private var teamName = ""
    @State private var lineup = Array(repeating: LineupSlot(), count: lineupCount)
    
    var body: some View {
        TextField(team, text: $teamName)
        LineupColumnView(lineup: $lineup, subRows: 3, slotHeight: 90, headerHeight: 30)
    }
}

#Preview {
    ScorecardView(team: "Away Team")
}
