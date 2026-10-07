//
//  LineupColumnView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/5/26.
//

import SwiftUI

struct LineupColumnView: View {
    @State private var playerNames = Array(repeating: "", count: 13)
    var body: some View {
        VStack {
            Text("Player")
                .frame(width: 300, height: 25)
                .foregroundStyle(.white)
                .background(.black)
            ForEach(playerNames.indices, id: \.self) { index in
                TextField("Player \(index + 1)", text: $playerNames[index])
                    .frame(width: 300, height: 50)
                    .background(.gray)
            }
        }
    }
}

#Preview {
    LineupColumnView()
}
