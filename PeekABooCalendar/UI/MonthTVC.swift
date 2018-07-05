//
//  MonthTVC.swift
//  StateRestoration
//
//  Created by Ish on 5/27/18.
//  Copyright © 2018 Illuminated Bits LLC. All rights reserved.
//

import UIKit

class MonthTVC: UITableViewController {
    var date = Date()
    var data:[Month] = [.january,
                        .february,
                        .march,
                        .april,
                        .may,
                        .june,
                        .july,
                        .august,
                        .september,
                        .october,
                        .november,
                        .december]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.tabBarController?.tabBar.backgroundColor = .black
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "monthCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].string().capitalized
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "days") as! DaysTVC
        let month = data[indexPath.row]
        if  let date = fetchDate(month){
            vc.date = date
        }
        vc.month = month
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchDate(_ month:Month)->Date?{
        let cal = Calendar.autoupdatingCurrent
        var components = cal.dateComponents([.year], from: self.date)
        components.month = month.month()
        return cal.date(from: components)
    }
    
}
