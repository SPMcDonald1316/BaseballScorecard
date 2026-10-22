//
//  ScorecardView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/2/26.
//

import SwiftUI

struct ScorecardView: View {
    let team: String
    let notes: String
    // TODO: make lineupCount dynamic (can add slots for more batters)
    // TODO: inningCount moves to GameView (@State, starts at 9, only increases) and is passed down to both team scorecards
    static let lineupCount = 9
    let rowHeight: CGFloat = 75
    let headerHeight: CGFloat = 25
    let nameColumnWidth: CGFloat = 135
    @State private var teamName = ""
    @State private var teamNotes = ""
    @State private var lineup = (0..<lineupCount).map { _ in LineupSlot()}
    @State private var pitchers = (0..<5).map { _ in PitcherLine() }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 5) {
                    TextField(team, text: $teamName)
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .background(.gray.opacity(0.5))
                    TextField(notes, text: $teamNotes)
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .background(.gray.opacity(0.5))
                    
                }
                .padding(.horizontal)
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
                .padding(.top)
                HStack(alignment: .top, spacing: 5) {
                    PitchingTotalsView(
                        nameColumnWidth: nameColumnWidth,
                        cellHeight: headerHeight,
                        cellWidth: 45,
                        headerHeight: headerHeight,
                        pitchers: $pitchers
                    )
                    BattingTotalsView(
                        nameColumnWidth: nameColumnWidth,
                        cellHeight: headerHeight,
                        cellWidth: 45,
                        headerHeight: headerHeight,
                        lineup: $lineup
                    )
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    ScorecardView(team: "Away Team", notes: "Team Notes")
}
