//
//  TemperatureRange.swift
//  UnitConverter
//
//  Created by Ilya on 25.07.17.
//  Copyright © 2017 Ilya. All rights reserved.
//

import UIKit

class TemperatureRange: NSObject, UIPickerViewDataSource {
    
    let values = (-100...100).map { $0 }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
}
