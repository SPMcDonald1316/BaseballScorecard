//
//  GameView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/5/26.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        VStack {
            GameInfoView()
            ScorecardView(team: "Away Team")
        }
    }
}

#Preview {
    GameView()
}
