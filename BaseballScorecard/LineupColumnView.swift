//
//  LineupColumnView.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/5/26.
//

import SwiftUI

struct LineupColumnView: View {
    @Binding var lineup: [LineupSlot]
    let subRows: Int
    let slotHeight: CGFloat
    let headerHeight: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Player")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: headerHeight)
                .background(.black)
            ForEach($lineup) { $slot in
                VStack(spacing: 0) {
                    ForEach($slot.lines) { $line in
                        TextField("", text: $line.name)
                            .frame(height: slotHeight / CGFloat(subRows))
                            .overlay(Rectangle().stroke(.black, lineWidth: 0.5))
                    }
                }
                .overlay(Rectangle().stroke(.black, lineWidth: 1.5))
            }
        }
    }
}
