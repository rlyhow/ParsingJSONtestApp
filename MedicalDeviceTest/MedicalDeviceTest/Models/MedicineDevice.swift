//
//  MedicineDevice.swift
//  MedicalDeviceTest
//
//  Created by Mikita Shalima on 26.04.22.
//

import Foundation

// MARK: - MedicineDevice
struct MedicineDevice: Codable {
    let coverObj: CoverObj
}

// MARK: - CoverObj
struct CoverObj: Codable {
    let fName: String
    let fileType: Int
    let place, descr, recordname: String
    let recordtype: Int
    let eltaID: String
    let datelong: Int
    let branch, pressure, sugar: String
    let scale, density, frequency, pulse: Int
    let recordstartdate, ampmode, stressindex, br: Int
    let sessionID, condition, application, imei: String
    let metrology: Metrology
    let extattributes, filecontent: String

    enum CodingKeys: String, CodingKey {
        case fName = "f_name"
        case fileType = "file_type"
        case place, descr, recordname, recordtype, eltaID, datelong, branch, pressure, sugar, scale, density, frequency, pulse, recordstartdate, ampmode, stressindex, br, sessionID, condition, application, imei, metrology, extattributes, filecontent
    }
}

// MARK: - Metrology
struct Metrology: Codable {
    let id, idTypeSignal, idSection, idOperation: String

    enum CodingKeys: String, CodingKey {
        case id
        case idTypeSignal = "id_type_signal"
        case idSection = "id_section"
        case idOperation = "id_operation"
    }
}
