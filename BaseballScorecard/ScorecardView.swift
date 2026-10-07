//
//  ScorecardView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/2/26.
//

import SwiftUI

struct ScorecardView: View {
    @State private var teamName = ""
    let team: String
    
    var body: some View {
        TextField(team, text: $teamName)
    }
}

#Preview {
    ScorecardView(team: "Away Team")
}
