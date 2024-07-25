//
//  DateExtension.swift
//  Notes
//
//  Created by Amine Hajri on 27.06.24.
//

import Foundation

extension Date {
    
    static var today: Date {
        Date()
    }
    
    static var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: today)!
    }
    
    static var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: today)!
    }
    
    var formatAsString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/DD/YYYY"
        return formatter.string(from: self)
    }
}
