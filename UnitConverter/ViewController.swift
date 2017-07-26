//
//  ViewController.swift
//  UnitConverter
//
//  Created by Ilya on 25.07.17.
//  Copyright © 2017 Ilya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    let userDefaultsLastRowKey = "defaultCelsiusPickerRow"
    
    @IBOutlet weak var celsiusPicker: UIPickerView!
    
    @IBOutlet var temperatureRange: TemperatureRange!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    private let converter = UnitConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let row = initialPickerRow()
        celsiusPicker.selectRow(row, inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: row, inComponent: 0)
    }
    
    func initialPickerRow() -> Int {
        let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int
        if let row = savedRow  {
            return row
        } else {
            return celsiusPicker.numberOfRows(inComponent: 0) / 2
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = temperatureRange.values[row]
        return "\(celsiusValue)°C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
                    inComponent component: Int) {
        displayConvertedTemperatureForRow(row)
        saveSelectedRow(row)
    }
    
    func displayConvertedTemperatureForRow(_ row: Int) {
        let degreesCelsius = temperatureRange.values[row]
        temperatureLabel.text = "\(converter.degreesFahrenheit(degreesCelsius))°F"
    }
    
    func saveSelectedRow(_ row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
    }
}

