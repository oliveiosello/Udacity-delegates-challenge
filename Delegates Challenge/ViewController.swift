//
//  ViewController.swift
//  Delegates Challenge
//
//  Created by Olive Iosello on 2/4/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let zipCodeDelegate = ZipCodeFieldDelegate()
    let moneyDelegate = MoneyFieldDelegate()
    
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var moneyField: UITextField!
    @IBOutlet weak var restrictedField: UITextField!
    @IBOutlet weak var restrictionSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.zipCodeField.delegate = self.zipCodeDelegate
        self.moneyField.delegate = self.moneyDelegate
        self.restrictedField.delegate = self
        self.restrictionSwitch.setOn(false, animated: false)
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.restrictionSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    @IBAction func toggleTheTextEditor(_ sender: AnyObject) {
        if !(sender as! UISwitch).isOn {
            self.restrictedField.resignFirstResponder()
        }
    }

}

