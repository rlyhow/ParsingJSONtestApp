//
//  ViewController.swift
//  MedicalDeviceTest
//
//  Created by Mikita Shalima on 26.04.22.
//

import UIKit

class ViewController: UIViewController {

    private var viewModel: ViewModel!
    
    private var receivedData: Data?
    private var fileName = "deviceInfo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureViewModel()
    }
    
    func configureViewModel() {
        viewModel = ViewModel(jsonParserService: JsonParser())
        
        viewModel.receivedData.bind { [unowned self] (newData) in
            receivedData = newData
            print("GET \(newData)")
        }
    }
    
    @IBAction func loadFile(_ sender: Any) {
        viewModel.fileName = fileName
        viewModel.loadMedicineDeviceModel()
    }
    
    @IBAction func getDataFromEncodedString(_ sender: Any) {
        viewModel.getDataFrom(base64String: viewModel.medicineDeviceObject?.coverObj.filecontent)
    }
    
    @IBAction func printArrayOfBytes(_ sender: Any) {
        if let data = receivedData {
            print([UInt8](data))
        } else {
            print("ERROR: CAN'T GET ARRAY OF BYTES FROM DATA")
        }
    }
    
    @IBAction func printArrayOfDoubles(_ sender: Any) {
        viewModel.getArrayOfDoubles()
    }
    
}

