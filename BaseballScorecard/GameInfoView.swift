//
//  GameInfoView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/2/26.
//

import SwiftUI

struct GameInfoView: View {
    @Environment(\.dismiss) var dismiss
    @State private var date = Date()
    @State private var timeOfGame = ""
    @State private var ballpark = ""
    @State private var location = ""
    @State private var gameNotes = ""
    
    var body: some View {
        NavigationStack {
            Form {
                DatePicker("Date", selection: $date, displayedComponents: .date)
                DatePicker("First Pitch", selection: $date,  displayedComponents: .hourAndMinute)
                TextField("Time of Game", text: $timeOfGame)
                TextField("Ballpark", text: $ballpark)
                TextField("Location", text: $location)
                TextField("Game Notes", text: $gameNotes, axis: .vertical)
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
    GameInfoView()
}
