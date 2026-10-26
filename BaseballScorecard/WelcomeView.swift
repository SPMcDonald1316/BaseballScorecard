//
//  Launch.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/26/26.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Baseball Scorecard")
                .font(.system(size: 90))
            Spacer()
            NavigationLink() {
                GameView()
            } label: {
                Text("New Game")
                    .frame(width: 600, height: 100)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            }
            
            NavigationLink() {
                Text("Past Games")
            } label: {
                Text("Past Games")
                    .frame(width: 600, height: 100)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            }
            
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        WelcomeView()
    }
}
