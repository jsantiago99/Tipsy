//
//  Bill.swift
//  Tipsy
//
//  Created by John Santiago on 2/5/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

struct Bill {
    var billTotal : Double?
    var splitTotal: Double?
    var settings : String?
    
    init(billTotal: Double, splitTotal:Double) {
        self.billTotal = billTotal
        self.splitTotal = splitTotal
    }
    
}
