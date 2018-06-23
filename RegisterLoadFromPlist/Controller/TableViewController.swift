//
//  TableViewController.swift
//  RegisterLoadFromPlist
//
//  Created by tham gia huy on 6/14/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.shared.cities.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = DataService.shared.cities[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        DataService.shared.getDataDistricts()
        if let indexPath = tableView.indexPathForSelectedRow {
            let showTableViewController = segue.destination as? ShowTableViewController
            showTableViewController?.cityCode = DataService.shared.cities[indexPath.row].cityCode
            UserDefaults.standard.set(DataService.shared.cities[indexPath.row].name, forKey: "city")
            print(DataService.shared.cities[indexPath.row].name)
        }
    }
    
}
