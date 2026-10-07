//
//  ScorecardView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/2/26.
//

import SwiftUI

struct ScorecardView: View {
    let team: String
    @State private var teamName = ""
    var body: some View {
        TextField(team, text: $teamName)
    }
}

#Preview {
    ScorecardView(team: "Away Team")
}
