//
//  JsonParser.swift
//  MedicalDeviceTest
//
//  Created by Mikita Shalima on 26.04.22.
//

import Foundation

class JsonParser {
    
    func loadJson(filename fileName: String) -> MedicineDevice? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MedicineDevice.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
}
