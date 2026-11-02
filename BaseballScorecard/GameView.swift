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
    @State private var showingHome = false
    var body: some View {
        TabView {
            if showingHome {
                ScorecardView(team: "Home Team", notes: "Team Notes", inningCount: inningCount)
            } else {
                ScorecardView(team: "Away Team", notes: "Team Notes", inningCount: inningCount)
            }
        }
        .tabViewStyle(.page)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Picker("Team", selection: $showingHome) {
                    Text("Home").tag(true)
                    Text("Away").tag(false)
                }
                .pickerStyle(.menu)
            }
            ToolbarItemGroup(placement: .topBarTrailing) {
                Menu("Add", systemImage: "plus") {
                    Button("Add Inning") {}
                    Button("Add Hitter") {}
                    Button("Add Pitcher") {}
                }
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

