//
//  RegisterViewController.swift
//  RegisterLoadFromPlist
//
//  Created by Đừng xóa on 6/23/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet var GenderButton: [UIButton]!
    @IBOutlet weak var nameTextField: UITextField!
    
    let ageNumbers = [Int](1...100)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agePicker.delegate = self
        agePicker.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func GenderButtonTap(_ sender: UIButton) {
        GenderButton.forEach { button in
            button.isSelected = false
        }
        sender.isSelected = true
        if sender.isSelected == true {
            UserDefaults.standard.set("\(sender.currentTitle!)", forKey: "gender")
        }
    }
    
    @IBAction func registerButtonTap(_ sender: UIButton) {
        if nameTextField.text != nil {
            UserDefaults.standard.set(nameTextField.text, forKey: "name")
        }
        
        let selectedAgePicker = ageNumbers[agePicker.selectedRow(inComponent: (0))]
        UserDefaults.standard.set(selectedAgePicker, forKey: "age")
        print(UserDefaults.standard.object(forKey: "age"))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageNumbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(ageNumbers[row])"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
