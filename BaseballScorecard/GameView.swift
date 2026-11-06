//
//  GameView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/5/26.
//

import SwiftUI

struct GameView: View {
    @Bindable var game: Game
    @State private var gameInfoActive = false
    @State private var showingHome = false
    var body: some View {
        ZStack {
            if showingHome {
                ScorecardView(
                    team: "Home Team",
                    notes: "Team Notes",
                    inningCount: game.inningCount
                )
                .transition(.move(edge: .trailing))
            } else {
                ScorecardView(
                    team: "Away Team",
                    notes: "Team Notes",
                    inningCount: game.inningCount
                )
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: showingHome)
        .clipped()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Picker("Team", selection: $showingHome) {
                    Text(game.awayName).tag(false)
                    Text(game.homeName).tag(true)
                }
                .pickerStyle(.menu)
            }
            ToolbarItemGroup(placement: .topBarTrailing) {
                Menu("Add", systemImage: "plus") {
                    Button("Add Inning") { game.inningCount += 1 }
                    Button("Add Hitter") {}
                    Button("Add Pitcher") {}
                }
                Button("Game Info") {
                    gameInfoActive = true
                }
            }
        }
        .sheet(isPresented: $gameInfoActive) {
            GameInfoView(game: game)
        }
        .onAppear {
            if !game.hasBeenStarted {
                game.hasBeenStarted = true
                gameInfoActive = true
            }
        }
    }
}

#Preview {
    GameView(game: Game())
}

