//
//  Months.swift
//  StateRestoration
//
//  Created by Ish on 5/27/18.
//  Copyright © 2018 Illuminated Bits LLC. All rights reserved.
//

import Foundation

enum Month:String{
    case january
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    func string() -> String {
        return self.rawValue
    }
    func days(_ year:Int? = nil) -> Int{
        var dateComponents = DateComponents()
        dateComponents.year = year ?? 2018
        dateComponents.month = 7
        
       
        switch self {
        case .january:
            dateComponents.month = 1
        case .february:
            dateComponents.month = 2
        case .march:
            dateComponents.month = 3
        case .april:
            dateComponents.month = 4
        case .may:
            dateComponents.month = 5
        case .june:
            dateComponents.month = 6
        case .july:
            dateComponents.month = 7
        case .august:
            dateComponents.month = 8
        case .september:
            dateComponents.month = 9
        case .october:
            dateComponents.month = 10
        case .november:
            dateComponents.month = 11
        case .december:
            dateComponents.month = 12
    
        }
        
        let calendar = Calendar.autoupdatingCurrent
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        return numDays
    }
    
    func month() -> Int{
        
        
        switch self {
        case .january:
           return 1
        case .february:
           return 2
        case .march:
           return 3
        case .april:
           return 4
        case .may:
           return 5
        case .june:
           return 6
        case .july:
           return 7
        case .august:
           return 8
        case .september:
           return 9
        case .october:
           return 10
        case .november:
           return 11
        case .december:
           return 12
            
        }
     
    }
}

extension Month:Codable{
    
}
