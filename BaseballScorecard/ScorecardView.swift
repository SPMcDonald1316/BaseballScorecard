//
//  ScorecardView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/2/26.
//

import SwiftUI

struct ScorecardView: View {
    @Binding var team: Team
    let inningCount: Int
    let rowHeight: CGFloat = 75
    let headerHeight: CGFloat = 25
    let nameColumnWidth: CGFloat = 135
    @FocusState private var notesFocused: Bool
    
    var body: some View {
        GeometryReader { proxy in
            // scaling to 11in iPad width
            let scale = proxy.size.width / 834
            ScrollView {
                VStack {
                    HStack(spacing: 0) {
                        LineupColumnView(
                            lineup: $team.lineup,
                            subRows: 3,
                            rowHeight: rowHeight * scale,
                            headerHeight: headerHeight * scale,
                            nameColumnWidth: nameColumnWidth * scale
                        )
                        ScrollViewReader { reader in
                            ScrollView(.horizontal) {
                                ScoringGrid(
                                    rowCount: team.lineup.count,
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
                                pitchers: $team.pitchers
                            )
                            
                            TextField("Team Notes", text: $team.notes, axis: .vertical)
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
                            lineup: $team.lineup
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
    ScorecardView(team: .constant(Team()), inningCount: 9)
}
