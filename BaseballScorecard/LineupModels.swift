//
//  LineupModels.swift
//  BaseballScorecard
//
//  Created by Sean McDonald on 10/7/26.
//

import Foundation

struct PlayerLine {
    var name = ""
    var ab = 0
    var r = 0
    var h = 0
    var rbi = 0
    var so = 0
    var bb = 0
}


struct LineupSlot {
    var lines: [PlayerLine] = Array(repeating: PlayerLine(), count: 3)
}
