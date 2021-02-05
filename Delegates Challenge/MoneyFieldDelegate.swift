//
//  MoneyFieldDelegate.swift
//  Delegates Challenge
//
//  Created by Olive Iosello on 2/5/21.
//

import Foundation
import UIKit

class MoneyFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        var newText = oldText.replacingCharacters(in: range, with: string)
        let newTextString = String(newText)
        
        let digits = CharacterSet.decimalDigits
        var digitText = ""
        for c in (newTextString.unicodeScalars) {
            if digits.contains(UnicodeScalar(c.value)!) {
                digitText.append("\(c)")
            }
        }
        
        if let numOfPennies = Int(digitText) {
            newText = "$" + self.intToDollarString(numOfPennies) + "." + self.intToCentsString(numOfPennies)
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText
        
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func intToDollarString(_ value: Int) -> String {
        return String(value / 100)
    }
    
    func intToCentsString(_ value: Int) -> String {
        
        let cents = value % 100
        var centsString = String(cents)
        
        if cents < 10 {
            centsString = "0" + centsString
        }
    
        return centsString
    }
}
