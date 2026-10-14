//
//  LineupModels.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/7/26.
//

import Foundation

struct PlayerLine: Identifiable {
    let id = UUID()
    var name = ""
    var ab: Int? = nil
    var r: Int? = nil
    var h: Int? = nil
    var rbi: Int? = nil
    var so: Int? = nil
    var bb: Int? = nil
}


struct LineupSlot: Identifiable {
    let id = UUID()
    var lines: [PlayerLine] = Array(repeating: PlayerLine(), count: 3)
}
