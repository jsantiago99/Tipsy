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
        
    var billBrain = BillBrain()

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
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
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billBrain.checkTextField(billTextField: billTextField, zeroPctLabel: ZeroPctLabel.isSelected, tenPctLabel: tenPctLabel.isSelected, twentyPctButton: twentyPctButton.isSelected, splitNumberLabel: splitNumberlabel)
            performSegue(withIdentifier: "goToResult", sender: self)
            
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalValue = String(format: "%.2f", billBrain.getSplitTotal())
            destinationVC.settingsValue = billBrain.getSettingsString()
            
        }
    }

}

