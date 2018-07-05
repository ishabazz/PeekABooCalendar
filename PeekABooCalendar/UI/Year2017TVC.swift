//
//  Year2017TVC.swift
//  StateRestoration
//
//  Created by Demo on 6/11/18.
//  Copyright © 2018 Illuminated Bits LLC. All rights reserved.
//

import UIKit

class Year2017TVC: MonthTVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "2017"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font:
                                                                           UIFont.systemFont(ofSize: 36, weight: .heavy) ]
        if let tbc = self.tabBarController as? TabBarController{
            self.date = tbc.dateForViewController(self) ?? self.date
        }
    }
}
