//
//  ShowTableViewController.swift
//  RegisterLoadFromPlist
//
//  Created by tham gia huy on 6/15/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class ShowTableViewController: UITableViewController {

    var cityCode: Int!
    
    var districts: [District] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if cityCode != nil {
            districts = DataService.shared.fillterDistrict(with: cityCode)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return districts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.textLabel?.text = districts[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            UserDefaults.standard.set(DataService.shared.districts[indexPath.row].name, forKey: "district")
            print(DataService.shared.districts[indexPath.row].name)
    }
}
