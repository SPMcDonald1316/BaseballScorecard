//
//  InnTotalsView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/22/26.
//

import SwiftUI

struct InnTotalsView: View {
    let side: CGFloat
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(.black, lineWidth: 1)
            DiagonalDivider()
                .stroke(.gray, lineWidth: 0.5)
                .frame(width: side * 0.7, height: side * 0.7)
                
        }
        .frame(width: side, height: side)
    }
}

#Preview {
    InnTotalsView(side: 90)
}
