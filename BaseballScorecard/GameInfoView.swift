//
//  GameInfoView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/2/26.
//

import SwiftUI

struct GameInfoView: View {
    @State private var date = Date()
    @State private var timeOfGame = ""
    @State private var ballpark = ""
    @State private var location = ""
    @State private var gameNotes = ""
    
    var body: some View {
        DisclosureGroup("Game Info") {
            DatePicker("Date", selection: $date, displayedComponents: .date)
            DatePicker("First Pitch", selection: $date,  displayedComponents: .hourAndMinute)
            TextField("Time of Game", text: $timeOfGame)
            TextField("Ballpark", text: $ballpark)
            TextField("Location", text: $location)
            TextField("Game Notes", text: $gameNotes, axis: .vertical)
        }
    }
}

#Preview {
    GameInfoView()
}
