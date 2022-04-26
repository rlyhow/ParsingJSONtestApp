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
            print(receivedData)
        }
    }
    
    @IBAction func loadFile(_ sender: Any) {
        viewModel.fileName = fileName
        viewModel.getDeviceInfo()
    }
    
    @IBAction func getNumbers(_ sender: Any) {
        viewModel.getDataFrom(base64String: viewModel.medicineDeviceObject?.coverObj.filecontent)
    }
}

