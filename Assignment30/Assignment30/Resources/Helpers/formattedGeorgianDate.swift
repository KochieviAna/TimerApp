//
//  formattedGeorgianDate.swift
//  Assignment30
//
//  Created by MacBook on 13.12.24.
//

import SwiftUI

func formattedGeorgianDate(from date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d MMM yyyy"
    
    let formattedDate = dateFormatter.string(from: date)
    
    let monthNames = [
        "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ]
    
    let georgianMonths = [
        "იან", "თებ", "მარ", "აპრ", "მაი", "ივნ", "ივლ", "აგვ", "სექ", "ოქტ", "ნოე", "დეკ"
    ]
    
    var components = formattedDate.split(separator: " ")
    
    if components.count >= 2 {
        if let monthIndex = monthNames.firstIndex(of: String(components[1])) {
            components[1] = Substring(georgianMonths[monthIndex])
        }
    }
    return components.joined(separator: " ")
}
