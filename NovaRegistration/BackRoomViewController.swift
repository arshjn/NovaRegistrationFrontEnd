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
    
    @IBOutlet weak var FloorSelector: UIPickerView!
    @IBOutlet weak var BuildingNameText: UILabel!
    
    var RoomData: [String] = [String]()
    var FloorData: [Int] = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.RoomSelector.delegate = self
        self.RoomSelector.dataSource = self
        self.FloorSelector.delegate = self
        self.FloorSelector.dataSource = self
        RoomData = [
        "Leo Goodwin Sr. Residence Hall",
        "The Commons",
        "Founders, Farqhuar and Vettel",
        "Cultural Living Center",
        "Mako Hall",
        "Rolling Hills A",
        "Rolling Hills C"
        ]
        FloorData = [1,2,3,4]
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
        if pickerView == RoomSelector
        {
            return RoomData.count
        }
        else
        {
            return FloorData.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == RoomSelector
        {
            return RoomData[row]
        }
        else
        {
            return String(FloorData[row])
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == RoomSelector
        {
            BuildingNameText.text = RoomData[row]
        }
    }
}
