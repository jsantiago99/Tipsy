//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var ZeroPctLabel: UIButton!
    @IBOutlet weak var tenPctLabel: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberlabel: UILabel!
        
   

    @IBAction func tipChanged(_ sender: UIButton) {
        if (sender.currentTitle == ZeroPctLabel.currentTitle) {
            ZeroPctLabel.isSelected = true
            tenPctLabel.isSelected = false
            twentyPctButton.isSelected = false
        } else if (sender.currentTitle == tenPctLabel.currentTitle) {
            ZeroPctLabel.isSelected = false
            tenPctLabel.isSelected = true
            twentyPctButton.isSelected = false
        } else {
            ZeroPctLabel.isSelected = false
            tenPctLabel.isSelected = false
            twentyPctButton.isSelected = true
        }
        
    }
    
    @IBAction func stepValueChanged(_ sender: UIStepper) {
        splitNumberlabel.text = Int(sender.value).description
        print(splitNumberlabel.text)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if (ZeroPctLabel.isSelected) {
            print(0.0)
        } else if (tenPctLabel.isSelected) {
            print(0.1)
        } else {
            print(0.2)
        }
    }

}

