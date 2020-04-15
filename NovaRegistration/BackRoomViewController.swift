//
//  BackRoomViewController.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 4/15/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

import UIKit

class BackRoomViewController: UIViewController {
    @IBOutlet weak var RoomSelector: UIPickerView!
    
    @IBOutlet weak var BuildingNameText: UILabel!
    
    var RoomData: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.RoomSelector.delegate = self
        self.RoomSelector.dataSource = self
        RoomData = [
        "Leo Goodwin Sr. Residence Hall",
        "The Commons",
        "Founders, Farqhuar and Vettel",
        "Cultural Living Center",
        "Mako Hall",
        "Rolling Hills A",
        "Rolling Hills C"
        ]
        // Do any additional setup after loading the view.
    }
    @IBAction func BackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension BackRoomViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return RoomData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return RoomData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        BuildingNameText.text = RoomData[row]
    }
}
