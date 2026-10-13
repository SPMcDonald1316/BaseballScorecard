//
//  ScoreBoxView.swift
//  
//
//  Created by Sean McDonald on 10/12/26.
//

import SwiftUI

struct ScoreBoxView: View {
    // TODO: ball and strike stacks duplicate the same circle code; pull into one reusable piece
    // TODO: replace magic numbers (0.6 diamond, 0.1 circle, 0.02 spacing, 0.05 padding) with named constants once sizes are settled on the iPad
    let side: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(.black, lineWidth: 1)
            DiamondShape()
                .stroke(.gray, lineWidth: 0.5)
                .frame(width: side *  0.6, height: side * 0.6)
            VStack {
                Spacer()
                HStack(alignment: .bottom, spacing: side * 0.02) {
                    VStack(spacing: side * 0.02) {
                        ForEach(0..<3, id: \.self) { _ in
                            Circle()
                                .stroke(.gray, lineWidth: 0.5)
                                .frame(width: side * 0.1, height: side * 0.1)
                        }
                    }
                    
                    VStack(spacing: side * 0.02) {
                        ForEach(0..<2, id: \.self) { _ in
                            Circle()
                                .stroke(.gray, lineWidth: 0.5)
                                .frame(width: side * 0.1, height: side * 0.1)
                        }
                    }
                    Spacer()
                }
            }
            .padding(side * 0.05)
            .frame(width: side, height: side)
        }
        .frame(width: side, height: side)
    }
}

#Preview {
    ScoreBoxView(side: 90)
}
