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
    let inningCount: Int
    // TODO: make lineupCount dynamic (can add slots for more batters)
    static let lineupCount = 9
    let rowHeight: CGFloat = 75
    let headerHeight: CGFloat = 25
    let nameColumnWidth: CGFloat = 135
    @State private var teamName = ""
    @State private var teamNotes = ""
    @State private var lineup = (0..<lineupCount).map { _ in LineupSlot()}
    @State private var pitchers = (0..<5).map { _ in PitcherLine() }
    @FocusState private var notesFocused: Bool
    
    var body: some View {
        GeometryReader { proxy in
            // scaling to 11in iPad width
            let scale = proxy.size.width / 834
            ScrollView {
                VStack {
                    HStack(spacing: 0) {
                        LineupColumnView(
                            lineup: $lineup,
                            subRows: 3,
                            rowHeight: rowHeight * scale,
                            headerHeight: headerHeight * scale,
                            nameColumnWidth: nameColumnWidth * scale
                        )
                        ScrollViewReader { reader in
                            ScrollView(.horizontal) {
                                ScoringGrid(
                                    rowCount: lineup.count,
                                    inningCount: inningCount,
                                    rowHeight: rowHeight * scale,
                                    headerHeight: headerHeight * scale
                                )
                                .id("grid")
                            }
                            .scrollBounceBehavior(.basedOnSize)
                            .onChange(of: inningCount) {
                                withAnimation { reader.scrollTo("grid", anchor: .trailing)}
                            }
                        }
                    }
                    .padding(.horizontal, 12 * scale)
                    .padding(.top)
                    HStack(alignment: .top, spacing: 5) {
                        VStack {
                            PitchingTotalsView(
                                nameColumnWidth: nameColumnWidth * scale,
                                cellHeight: headerHeight * scale,
                                cellWidth: 45 * scale,
                                headerHeight: headerHeight * scale,
                                pitchers: $pitchers
                            )
                            
                            TextField(notes, text: $teamNotes, axis: .vertical)
                                .focused($notesFocused)
                                .frame(maxWidth: 405 * scale, minHeight: 100, alignment: .topLeading)
                                .background(.gray.opacity(0.5))
                                .contentShape(Rectangle())
                                .onTapGesture { notesFocused = true }
                        }
                        BattingTotalsView(
                            nameColumnWidth: nameColumnWidth * scale,
                            cellHeight: headerHeight * scale,
                            cellWidth: 45 * scale,
                            headerHeight: headerHeight * scale,
                            lineup: $lineup
                        )
                    }
                    .padding(.top)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    ScorecardView(team: "Away Team", notes: "Team Notes", inningCount: 9)
}
