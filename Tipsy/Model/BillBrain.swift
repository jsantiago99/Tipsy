//
//  BillBrain.swift
//  Tipsy
//
//  Created by John Santiago on 2/5/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

class BillBrain {
    
    var bill = Bill(billTotal: 0.0, splitTotal: 0.0)
    var tipAmount : Int?
    
    
    func checkTextField(billTextField : UITextField?, zeroPctLabel : Bool?, tenPctLabel : Bool?, twentyPctButton : Bool?, splitNumberLabel: UILabel?) {
        if (billTextField != nil) {
            bill.billTotal = Double((billTextField?.text!)!)
            if ((tenPctLabel!)) {
                bill.billTotal! = ((bill.billTotal ?? 0.0) * 0.1) + bill.billTotal!
            } else if ((twentyPctButton!)) {
                bill.billTotal! = ((bill.billTotal ?? 0.0) * 0.2) + bill.billTotal!
                tipAmount = 20
            } else if ((zeroPctLabel!)){
                bill.billTotal = bill.billTotal
                tipAmount = 0
            }
        }
            
            bill.splitTotal = Double(bill.billTotal!) / Double((splitNumberLabel?.text!)!)!
            bill.settings = "Split between \(splitNumberLabel?.text! ?? "Error") with \(tipAmount ?? 0)% tip."
    }

    
        func getSplitTotal() -> Double {
            return bill.splitTotal ?? 0.00
        }
        
        func getBillTotal() -> Double {
            return bill.billTotal ?? 0.00
        }
        func getSettingsString() -> String {
            return bill.settings ?? "Error"
        }
}
