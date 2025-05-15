//
//  TimerModel.swift
//  Assignment30
//
//  Created by MacBook on 11.12.24.
//

import Foundation

struct TimerModel: Identifiable, Codable {
    var id = UUID()
    var title: String
    var duration: Int
    var timeRemaining: Int
    var isON: Bool = false
    var usageHistory: [TimerHistory] = []
    
    init(title: String, duration: Int) {
        self.title = title
        self.duration = duration
        self.timeRemaining = duration
    }
}

struct TimerHistory: Identifiable, Codable {
    var id = UUID()
    var stopDate: Date
    var elapsedTime: Int
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: stopDate)
    }
}
