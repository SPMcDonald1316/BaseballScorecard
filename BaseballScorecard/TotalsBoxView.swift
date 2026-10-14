//
//  TotalsBoxView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/13/26.
//

import SwiftUI

struct TotalsBoxView: View {
    let rowHeight: CGFloat
    @Binding var stat: Int?
    
    var body: some View {
        TextField("", value: $stat, format: .number)
            .frame(width: rowHeight / 2, height: rowHeight / 3)
            .overlay(Rectangle().stroke(.black, lineWidth: 0.5))
            .keyboardType(.numberPad)
    }
}

