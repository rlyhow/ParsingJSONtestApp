//
//  ViewModel.swift
//  MedicalDeviceTest
//
//  Created by Mikita Shalima on 26.04.22.
//

import Foundation

class ViewModel {
    
    var receivedData: Box<Data> = Box(Data())
    var fileName: String?
    
    var medicineDeviceObject: MedicineDevice?
    private let jsonParserService: JsonParser
    
    init(jsonParserService: JsonParser) {
        self.jsonParserService = jsonParserService
    }
    
    func loadMedicineDeviceModel() {
        guard let name = fileName else {
            print("ERROR: CAN'T FIND FILE")
            return
        }
        medicineDeviceObject = jsonParserService.loadJson(filename: name)
        print("SUCCESS LOAD FILE")
    }
    
    func getDataFrom(base64String stringFromFile: String?) {
        guard let base64String = stringFromFile else {
            print("ERROR: CAN'T GET STRING FROM MODEL")
            return
        }
        
        guard let dataFromEncodedString = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) else {
            print("ERROR: CAN'T GET DATA FROM base64String")
            return
        }
        
        receivedData.value = dataFromEncodedString
    }
    
    func getArrayOfDoubles() {
        
        var arrayOfDoubles = [Double]()
        let multiDimensionalArray = [UInt8](receivedData.value).chunked(into: MemoryLayout<Double>.stride)
        
        multiDimensionalArray.forEach({
            arrayOfDoubles.append(binaryToType($0, Double.self))
        })
        
        print(arrayOfDoubles)
    }
    
    func binaryToType <T> (_ value: [UInt8], _: T.Type) -> T
    {
        return value.withUnsafeBufferPointer {
            $0.baseAddress!
              .withMemoryRebound(to: T.self, capacity: 1) {
                $0.pointee
            }
        }
    }
    
}
