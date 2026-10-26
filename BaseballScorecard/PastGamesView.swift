//
//  PastGamesView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/26/26.
//

import SwiftUI

struct PastGamesView: View {
    var body: some View {
        List(1...3, id: \.self) { i in
            NavigationLink("Game \(i)") {
                GameView()
            }
        }
        .navigationTitle("Past Games")
    }
}

#Preview {
    PastGamesView()
}
