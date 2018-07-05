//
//  TabBarController.swift
//  StateRestoration
//
//  Created by Demo on 6/11/18.
//  Copyright © 2018 Illuminated Bits LLC. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {return .lightContent}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = .black
        self.tabBar.backgroundColor = .black
        self.tabBar.tintColor =  UIColor(red: CGFloat(0)/CGFloat(255), green: CGFloat(253)/CGFloat(255), blue: CGFloat(255)/CGFloat(255), alpha: 1.0)
    }
    
    func dateForViewController(_ viewController:MonthTVC) -> Date?{
        let cal = Calendar.autoupdatingCurrent
        if let _ = viewController as? Year2017TVC{
            let components = DateComponents(calendar: cal, timeZone: cal.timeZone, year: 2017)
            let date = cal.date(from: components)
            return date
        }
        else if let _ = viewController as? Year2018TVC{
            let components = DateComponents(calendar: cal, timeZone: cal.timeZone, year: 2018)
            let date = cal.date(from: components)
            return date
        }
        else if let _ = viewController as? Year2019TVC{
            let components = DateComponents(calendar: cal, timeZone: cal.timeZone, year: 2019)
            let date = cal.date(from: components)
            return date
        }
        return nil
    }
    
}
