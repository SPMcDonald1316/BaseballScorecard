//
//  Launch.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/26/26.
//

import SwiftUI
import SwiftData

struct WelcomeView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var newGame: Game?
    var body: some View {
        VStack {
            Spacer()
            Text("Baseball Scorecard")
                .font(.system(size: 90))
            Spacer()
            Button {
                let game = Game()
                modelContext.insert(game)
                newGame = game
            } label: {
                Text("New Game")
                    .frame(width: 600, height: 100)
                    .background(.blue, in: Capsule())
                    .contentShape(Capsule())
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            }
            .buttonStyle(.plain)
            NavigationLink() {
                PastGamesView()
            } label: {
                Text("Past Games")
                    .frame(width: 600, height: 100)
                    .background(.blue, in: Capsule())
                    .contentShape(Capsule())
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            }
            .buttonStyle(.plain)
            
            Spacer()
        }
        .navigationDestination(item: $newGame) { game in
            GameView(game: game)
        }
    }
}

#Preview {
    NavigationStack {
        WelcomeView()
    }
}
