//
//  GameInfoView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/2/26.
//

import SwiftUI

struct GameInfoView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var game: Game
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Teams") {
                    TextField("Away Team", text: $game.away.name)
                    TextField("Home Team", text: $game.home.name)
                }
                Section("Game") {
                    DatePicker("Date", selection: $game.date, displayedComponents: .date)
                    DatePicker("First Pitch", selection: $game.date,  displayedComponents: .hourAndMinute)
                    TextField("Time of Game", text: $game.timeOfGame)
                    TextField("Ballpark", text: $game.ballpark)
                    TextField("Location", text: $game.location)
                    TextField("Game Notes", text: $game.gameNotes, axis: .vertical)
                }
            }
            .navigationTitle("Game Info")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    GameInfoView(game: Game())
}
