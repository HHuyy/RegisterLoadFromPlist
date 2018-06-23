//
//  UserInfoViewController.swift
//  RegisterLoadFromPlist
//
//  Created by Đừng xóa on 6/23/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = UserDefaults.standard.object(forKey: "name") {
            nameLabel.text = name as? String
        }
        if let gender = UserDefaults.standard.object(forKey: "gender") {
            genderLabel.text = gender as? String
        }
        if let age = UserDefaults.standard.object(forKey: "age") {
            ageLabel.text = "\(age)"
        }
        if let city = UserDefaults.standard.object(forKey: "city") {
            cityLabel.text = city as? String
        }
        if let district = UserDefaults.standard.object(forKey: "district") {
            districtLabel.text = district as? String
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
