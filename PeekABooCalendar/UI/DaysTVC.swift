//
//  DaysTVC.swift
//  StateRestoration
//
//  Created by Ish on 5/27/18.
//  Copyright © 2018 Illuminated Bits LLC. All rights reserved.
//

import UIKit

class DaysTVC: UITableViewController {
    var date:Date = Date()
    var month:Month?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = month?.string().capitalized ?? ""
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cal = Calendar.autoupdatingCurrent
        let year = cal.component(.year, from: self.date)
        return month?.days(year) ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        guard let detail = story.instantiateViewController(withIdentifier: "detail") as? DetailVC else {return}
        let cal = Calendar.autoupdatingCurrent
        var comps = cal.dateComponents([.year,.month], from: self.date)
        comps.day = indexPath.row + 1
        detail.date = cal.date(from: comps) ?? self.date
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
}
