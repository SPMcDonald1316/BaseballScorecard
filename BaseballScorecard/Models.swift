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
    var atbats: Int?
    var runs: Int?
    var hits: Int?
    var runsBattedIn: Int?
    var strikeouts: Int?
    var walks: Int?
}


struct LineupSlot: Identifiable {
    let id = UUID()
    var lines: [PlayerLine] = Array(repeating: PlayerLine(), count: 3)
}

struct PitcherLine: Identifiable {
    let id = UUID()
    var name = ""
    var outs: Int?
    var hits: Int?
    var runs: Int?
    var earnedRuns: Int?
    var walks: Int?
    var strikeouts: Int?
    
    var inningsPitched: String {
        get {
            if let outs = outs {
                return "\(outs / 3).\(outs % 3)"
            } else {
                return ""
            }
        }
        
        set {
            // if field is blank leave it blank
            guard !newValue.isEmpty else {
                outs = nil
                return
            }
            
            // split IP into innings and the outs of partial innings
            var input = newValue.split(separator: ".", omittingEmptySubsequences: false)
            
            // if there is more than 2 pieces after split its bad input, leave blank
            guard input.count < 3 else {
                outs = nil
                return
            }
            
            // normalize the shape
            if input.count == 1 { input.append("0") }
            if input[0].isEmpty { input[0] = "0" }
            if input[1].isEmpty { input[1] = "0" }
            
            // ensure innings can convert to Int
            guard let inningsPart = Int(input[0]) else {
                outs = nil
                return
            }
            
            // ensure the outs part converts to Int
            guard let outsPart = Int(input[1]) else {
                outs = nil
                return
            }
            
            // ensure the innings are non negative
            guard inningsPart >= 0 else {
                outs = nil
                return
            }
            
            // ensure parts after decimal are 0, 1, or 2
            guard outsPart >= 0 && outsPart <= 2 else {
                outs = nil
                return
            }
            
            // convert IP to outs
            outs = (inningsPart * 3) + outsPart
        }
    }
}
