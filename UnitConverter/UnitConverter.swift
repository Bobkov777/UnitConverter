//
//  UnitConverter.swift
//  UnitConverter
//
//  Created by Ilya on 25.07.17.
//  Copyright © 2017 Ilya. All rights reserved.
//

import Foundation

class UnitConverter {
    
    func degreesFahrenheit(_ degreesCelsius: Int) -> Int {
        return Int(1.8 * Float(degreesCelsius) + 32.0)
    }
}
