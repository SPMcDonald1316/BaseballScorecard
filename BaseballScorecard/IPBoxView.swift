//
//  IPBoxView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/20/26.
//

import SwiftUI

struct IPBoxView: View {
    // TODO: test typing "6.1" on a real iPad keyboard; getter may rewrite text mid-typing, and the decimal pad may have no return key
    let cellHeight: CGFloat
    let cellWidth: CGFloat
    @Binding var ip: String
    
    var body: some View {
        TextField("", text: $ip)
            .frame(width: cellWidth, height: cellHeight)
            .overlay(Rectangle().stroke(.black, lineWidth: 0.5))
            .keyboardType(.decimalPad)
    }
}

#Preview {
    @Previewable @State var pitcher = PitcherLine()
    IPBoxView(cellHeight: 30, cellWidth: 30, ip: $pitcher.inningsPitched)
}
