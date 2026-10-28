//
//  GameView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/5/26.
//

import SwiftUI

struct GameView: View {
    @State private var inningCount = 9
    @State private var gameInfoActive = false
    var body: some View {
        
        TabView {
            ScorecardView(team: "Home Team", notes: "Team Notes", inningCount: inningCount)
            ScorecardView(team: "Away Team", notes: "Team Notes", inningCount: inningCount)
        }
        .tabViewStyle(.page)
        .toolbar {
            ToolbarItem {
                Button("Game Info") {
                    gameInfoActive = true
                }
            }
        }
        .sheet(isPresented: $gameInfoActive) {
            GameInfoView()
        }
    }
}

#Preview {
    GameView()
}

