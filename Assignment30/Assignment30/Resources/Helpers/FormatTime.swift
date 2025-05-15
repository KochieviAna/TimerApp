//
//  FormatTime.swift
//  Assignment30
//
//  Created by MacBook on 13.12.24.
//

import SwiftUI

func formatTime(_ time: Int) -> String {
    let hours = time / 3600
    let minutes = (time % 3600) / 60
    let seconds = time % 60
    
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
}

func formatTimeVerbally(_ time: Int) -> String {
    let hours = time / 3600
    let minutes = (time % 3600) / 60
    
    if hours > 0 {
        return "\(hours) სთ \(minutes) წთ"
    } else if minutes > 0 {
        return "\(minutes) წთ"
    } else {
        return "\(time % 60) წმ"
    }
}
