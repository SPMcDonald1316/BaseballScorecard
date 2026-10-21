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
    
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                TextField(team, text: $teamName)
                    .frame(width: .infinity, height: 100)
                    .background(.gray.opacity(0.5))
                TextField(notes, text: $teamNotes)
                    .frame(width: .infinity, height: 100)
                    .background(.gray.opacity(0.5))
                
            }
            .padding(.horizontal)
            .padding(.top)
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
            HStack {
                BattingTotalsView(
                    nameColumnWidth: nameColumnWidth,
                    cellHeight: headerHeight,
                    cellWidth: 45,
                    headerHeight: 30,
                    lineup: $lineup
                )
            }
        }
    }
}

#Preview {
    ScorecardView(team: "Away Team", notes: "Team Notes")
}
