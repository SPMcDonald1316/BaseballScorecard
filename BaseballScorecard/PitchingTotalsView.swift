//
//  PitchingTotalsView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/21/26.
//

import SwiftUI

struct PitchingTotalsView: View {
    let nameColumnWidth: CGFloat
    let cellHeight: CGFloat
    let cellWidth: CGFloat
    let headerHeight: CGFloat
    private let labels = ["IP", "H", "R", "ER", "BB", "K"]
    @Binding var pitchers: [PitcherLine]
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Pitcher")
                    .frame(width: nameColumnWidth, height: headerHeight)
                    .background(.black)
                    .foregroundStyle(.white)
                ForEach(labels, id: \.self) { label in
                    Text(label)
                        .frame(width: cellWidth, height: headerHeight)
                        .background(.black)
                        .foregroundStyle(.white)
                }
            }
            
            VStack(spacing: 0) {
                ForEach($pitchers) { $pitcher in
                    HStack(spacing: 0) {
                        TextField("", text: $pitcher.name)
                            .frame(width: nameColumnWidth, height: cellHeight)
                            .overlay(Rectangle().stroke(.black, lineWidth: 0.5))
                        IPBoxView(
                            cellHeight: cellHeight,
                            cellWidth: cellWidth,
                            ip: $pitcher.inningsPitched
                        )
                        TotalsBoxView(
                            cellHeight: cellHeight,
                            cellWidth: cellWidth,
                            stat: $pitcher
                                .hits)
                        TotalsBoxView(
                            cellHeight: cellHeight,
                            cellWidth: cellWidth,
                            stat: $pitcher
                                .runs)
                        TotalsBoxView(
                            cellHeight: cellHeight,
                            cellWidth: cellWidth,
                            stat: $pitcher
                                .earnedRuns)
                        TotalsBoxView(
                            cellHeight: cellHeight,
                            cellWidth: cellWidth,
                            stat: $pitcher
                                .walks)
                        TotalsBoxView(
                            cellHeight: cellHeight,
                            cellWidth: cellWidth,
                            stat: $pitcher
                                .strikeouts)
                    }
                }
            }
        }
    }
}

#Preview {
    PitchingTotalsView(
        nameColumnWidth: 135,
        cellHeight: 30,
        cellWidth: 45,
        headerHeight: 30,
        pitchers: .constant((0..<5).map { _ in PitcherLine()})
    )
}
