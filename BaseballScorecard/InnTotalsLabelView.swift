//
//  InnTotalsLabelView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/22/26.
//

import SwiftUI

struct InnTotalsLabelView: View {
    let side: CGFloat
    var body: some View {
        ZStack {
            Text("H")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
            DiagonalDivider()
                .stroke(.black, lineWidth: 1)
                .frame(width: side * 0.7, height: side * 0.7)
            Text("R")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding()
        }
        .frame(width: side, height: side)
    }
}

#Preview {
    InnTotalsLabelView(side: 90)
}
