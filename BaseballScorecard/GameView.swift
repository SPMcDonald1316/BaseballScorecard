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
        ZStack {
            if showingHome {
                ScorecardView(team: "Home Team", notes: "Team Notes", inningCount: inningCount)
                    .transition(.move(edge: .trailing))
            } else {
                ScorecardView(team: "Away Team", notes: "Team Notes", inningCount: inningCount)
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: showingHome)
        .clipped()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Picker("Team", selection: $showingHome) {
                    Text("Away").tag(false)
                    Text("Home").tag(true)
                }
                .pickerStyle(.menu)
            }
            ToolbarItemGroup(placement: .topBarTrailing) {
                Menu("Add", systemImage: "plus") {
                    Button("Add Inning") { inningCount += 1 }
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

