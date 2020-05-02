//
//  BackRoomViewController.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 4/15/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

import UIKit

class BackRoomViewController: UIViewController {
    //View Controller Outlets
    @IBOutlet weak var RoomSelector: UIPickerView!
    @IBOutlet weak var FloorSelector: UIPickerView!
    @IBOutlet weak var BuildingNameText: UILabel!
    @IBOutlet weak var Room101Button: UIButton!
    @IBOutlet weak var BookRoomImage: UIImageView!
    @IBOutlet weak var Room102Button: UIButton!
    @IBOutlet weak var Room103Button: UIButton!
    @IBOutlet weak var Room104Button: UIButton!
    @IBOutlet weak var Room105Button: UIButton!
    @IBOutlet weak var Room106Button: UIButton!
    @IBOutlet weak var Room107Button: UIButton!
    @IBOutlet weak var Room108Button: UIButton!
    @IBOutlet weak var Room109Button: UIButton!
    @IBOutlet weak var Room110Button: UIButton!
    @IBOutlet weak var RoomButton111Button: UIButton!
    
    var selectedBuilding = ""
    var selectedFloor = ""
    let username = Keychain.loadPassword(service: "NovaRoomRegistration", account: "user")
    
    var RoomSelected = false
    var FloorSelected = false
    var RoomData: [String] = [String]()
    let RoomKey = ["LGW", "COM", "FAR", "FDR", "VET", "CLC", "MKH", "RHA", "RHC"]
    var FloorData: [Int] = [Int]()
    var keyIndex = 0
    var RoomImages =
    [
        UIImage(named: "FloorPlanRedone1"),
        UIImage(named: "FloorPlanRedone2"),
        UIImage(named: "FloorPlanRedone3"),
        UIImage(named: "FloorPlan8-1"),
        UIImage(named: "FloorRedone5"),
        UIImage(named: "Cultural_Living_Center"),
        UIImage(named: "Mako_Hall"),
        UIImage(named: "Rolling_Hills_A")
    ]
    
    func BookRoom(roomButton: String)
    {
        print("Book room function")
        let url = "http://nova.us-east-2.elasticbeanstalk.com/api/ReserveRoom?NNumber="+username!+"&BuildingName="+selectedBuilding+"&RoomNum="+selectedFloor+roomButton
            print("Book url", url)
            let requestURL = URL(string: String(url))//1")
            var request = URLRequest(url:requestURL!)
            request.httpMethod = "POST"
            let task = URLSession.shared.dataTask(with: request)
            {
                
                (data: Data?, response: URLResponse?, error: Error?) in
                if (error != nil)
                {
                    print("error\(String(describing:error))")
                    return
                }
                //Converting data sent from server to our application
                
                do
                {
                    let Json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Bool
                    if Json == true
                    {
                        DispatchQueue.main.async {
                            let ReviewViewController = self.storyboard?.instantiateViewController(withIdentifier: "ReviewViewController") as! ReviewViewController
                        
                            self.present(ReviewViewController, animated: true)
                        }
                    }

                }
                catch
                {
                    print("couldn't do error\(String(describing:error))")
                }
            }
        task.resume()
    }
    @IBAction func Button101Pressed(_ sender: Any) {
        //print("101Pressed", Room101Button.title(for: .normal))
        if Room101Button.backgroundColor == UIColor.green{
            BookRoom(roomButton: "01")
        }
    }
    @IBAction func Button102Pressed(_ sender: Any) {
        print("102Pressed", Room102Button.title(for: .normal))
        if Room102Button.backgroundColor == UIColor.green{
            BookRoom(roomButton: "02")
        }
    }
    @IBAction func Button103Pressed(_ sender: Any) {
        print("103Pressed", Room103Button.title(for: .normal))
        if Room103Button.backgroundColor == UIColor.green{
            BookRoom(roomButton: "03")
        }
    }
    @IBAction func Button104Pressed(_ sender: Any) {
        print("104Pressed", Room104Button.title(for: .normal))
        if Room104Button.backgroundColor == UIColor.green{
            BookRoom(roomButton: "04")
        }
    }
    @IBAction func Button105Pressed(_ sender: Any) {
        print("105Pressed", Room105Button.title(for: .normal))
        if Room105Button.backgroundColor == UIColor.green{
            BookRoom(roomButton: "05")
        }
    }
    @IBAction func Button106Pressed(_ sender: Any) {
        print("106Pressed", Room106Button.title(for: .normal))
        if Room106Button.backgroundColor == UIColor.green{
            BookRoom(roomButton: "06")
        }
    }
    @IBAction func Button107Pressed(_ sender: Any) {
        print("107Pressed", Room107Button.title(for: .normal))
        if Room107Button.backgroundColor == UIColor.green{
            BookRoom(roomButton: "07")
        }
    }
    @IBAction func Button108Pressed(_ sender: Any) {
        print("108Pressed", Room108Button.title(for: .normal))
        if Room108Button.backgroundColor == UIColor.green{
            BookRoom(roomButton: "08")
        }
    }
    @IBAction func Button109Pressed(_ sender: Any) {
        print("109Pressed", Room109Button.title(for: .normal))
        if Room109Button.backgroundColor == UIColor.green{
            BookRoom(roomButton: "09")
        }
    }
    @IBAction func Button110Pressed(_ sender: Any) {
        print("110Pressed", Room110Button.title(for: .normal))
        if Room110Button.backgroundColor == UIColor.green{
            BookRoom(roomButton: "10")
        }
    }
    @IBAction func Button111Pressed(_ sender: Any) {
        print("111Pressed", RoomButton111Button.title(for: .normal))
        if RoomButton111Button.backgroundColor == UIColor.green{
            BookRoom(roomButton: "11")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Room101Button.frame = CGRect(x:113 ,y:266 , width:30 , height:30)
        Room102Button.frame = CGRect(x:119 ,y:337 , width:30 , height:30)
        Room103Button.frame = CGRect(x:119 ,y:381 , width:30 , height:30)
        Room104Button.frame = CGRect(x:119 ,y:425 , width:30 , height:30)
        Room105Button.frame = CGRect(x:119 ,y:463 , width:30 , height:30)
        Room106Button.frame = CGRect(x:119 ,y:510 , width:30 , height:30)
        Room107Button.frame = CGRect(x:119 ,y:631 , width:30 , height:30)
        Room108Button.frame = CGRect(x:192 ,y:637 , width:30 , height:30)
        Room109Button.frame = CGRect(x:192 ,y:510 , width:30 , height:30)
        Room110Button.frame = CGRect(x:192 ,y:336 , width:30 , height:30)
        RoomButton111Button.frame = CGRect(x:192 ,y:294 , width:30 , height:30)
        Room101Button.layer.cornerRadius = 15
        Room102Button.layer.cornerRadius = 15
        Room103Button.layer.cornerRadius = 15
        Room104Button.layer.cornerRadius = 15
        Room105Button.layer.cornerRadius = 15
        Room106Button.layer.cornerRadius = 15
        Room107Button.layer.cornerRadius = 15
        Room108Button.layer.cornerRadius = 15
        Room109Button.layer.cornerRadius = 15
        Room110Button.layer.cornerRadius = 15
        RoomButton111Button.layer.cornerRadius = 15
        BookRoomImage.image = RoomImages[0]
        
        self.RoomSelector.delegate = self
        self.RoomSelector.dataSource = self
        self.FloorSelector.delegate = self
        self.FloorSelector.dataSource = self
        RoomData = [
        "Leo Goodwin Sr. Residence Hall",
        "The Commons",
        "Founders",
        "Farqhuar",
        "Vettel",
        "Cultural Living Center",
        "Mako Hall",
        "Rolling Hills A",
        "Rolling Hills C"
        ]
        Room101Button.setTitle("101", for: .normal)
        Room102Button.setTitle("102", for: .normal)
        Room103Button.setTitle("103", for: .normal)
        Room104Button.setTitle("104", for: .normal)
        Room105Button.setTitle("105", for: .normal)
        Room106Button.setTitle("106", for: .normal)
        Room107Button.setTitle("107", for: .normal)
        Room108Button.setTitle("108", for: .normal)
        Room109Button.setTitle("109", for: .normal)
        Room110Button.setTitle("110", for: .normal)
        RoomButton111Button.setTitle("111", for: .normal )

        FloorData = [1,2,3]
        RoomSelector.selectRow(0, inComponent: 0, animated: true)
        RoomSelector.selectRow(0, inComponent: 0, animated: true)
        
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
            //print("floor:", FloorData[row])
            selectedFloor = String(FloorData[row])
            return String(FloorData[row])
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == RoomSelector
        {
            print("Title:", RoomData[row])
            if RoomData[row] == "Leo Goodwin Sr. Residence Hall"
            {
                //print("Entered goodwin")
                BookRoomImage.image = RoomImages[row]
                
                
                Room101Button.frame = CGRect(x:113 ,y:266 , width:30 , height:30)
                Room102Button.frame = CGRect(x:119 ,y:337 , width:30 , height:30)
                Room103Button.frame = CGRect(x:119 ,y:381 , width:30 , height:30)
                Room104Button.frame = CGRect(x:119 ,y:425 , width:30 , height:30)
                Room105Button.frame = CGRect(x:119 ,y:463 , width:30 , height:30)
                Room106Button.frame = CGRect(x:119 ,y:510 , width:30 , height:30)
                Room107Button.frame = CGRect(x:119 ,y:631 , width:30 , height:30)
                Room108Button.frame = CGRect(x:192 ,y:637 , width:30 , height:30)
                Room109Button.frame = CGRect(x:192 ,y:510 , width:30 , height:30)
                Room110Button.frame = CGRect(x:192 ,y:336 , width:30 , height:30)
                RoomButton111Button.frame = CGRect(x:192 ,y:294 , width:30 , height:30)
                RoomButton111Button.isHidden = false
                Room104Button.isHidden = false
            }
            else if RoomData[row] == "The Commons"
            {
                BookRoomImage.image = RoomImages[row]

                Room101Button.frame = CGRect(x:97 ,y:187 , width:30 , height:30)
                Room102Button.frame = CGRect(x:97 ,y:257 , width:30 , height:30)
                Room103Button.frame = CGRect(x:97 ,y:313 , width:30 , height:30)
                Room104Button.frame = CGRect(x:97 ,y:418 , width:30 , height:30)
                Room105Button.frame = CGRect(x:97 ,y:472 , width:30 , height:30)
                Room106Button.frame = CGRect(x:97 ,y:528 , width:30 , height:30)
                Room107Button.frame = CGRect(x:97 ,y:589 , width:30 , height:30)
                Room108Button.frame = CGRect(x:283 ,y:589 , width:30 , height:30)
                Room109Button.frame = CGRect(x:270 ,y:455 , width:30 , height:30)
                Room110Button.frame = CGRect(x:270 ,y:341 , width:30 , height:30)
                RoomButton111Button.isHidden = true
            }
            else if RoomData[row] == "Founders"
            {
                BookRoomImage.image = RoomImages[row]
 
                Room101Button.frame = CGRect(x:150 ,y:191 , width:30 , height:30)
                Room102Button.frame = CGRect(x:150 ,y:247 , width:30 , height:30)
                Room103Button.frame = CGRect(x:150 ,y:306 , width:30 , height:30)
                Room104Button.frame = CGRect(x:150 ,y:482 , width:30 , height:30)
                Room105Button.frame = CGRect(x:150 ,y:537 , width:30 , height:30)
                Room106Button.frame = CGRect(x:150 ,y:589 , width:30 , height:30)
                Room107Button.frame = CGRect(x:245 ,y:589 , width:30 , height:30)
                Room108Button.frame = CGRect(x:245 ,y:537 , width:30 , height:30)
                Room109Button.frame = CGRect(x:245 ,y:482 , width:30 , height:30)
                Room110Button.frame = CGRect(x:245 ,y:306 , width:30 , height:30)
                Room107Button.frame = CGRect(x:245 ,y:247 , width:30 , height:30)
            }
            else if RoomData[row] == "Farqhuar"
            {
                BookRoomImage.image = RoomImages[row]

                Room101Button.frame = CGRect(x:68 ,y:168 , width:30 , height:30)
                Room102Button.frame = CGRect(x:68 ,y:233 , width:30 , height:30)
                Room103Button.frame = CGRect(x:68 ,y:329 , width:30 , height:30)
                Room104Button.frame = CGRect(x:68 ,y:399 , width:30 , height:30)
                Room105Button.frame = CGRect(x:181 ,y:631 , width:30 , height:30)
                Room106Button.frame = CGRect(x:230 ,y:631 , width:30 , height:30)
                Room107Button.frame = CGRect(x:276 ,y:631 , width:30 , height:30)
                Room108Button.frame = CGRect(x:314 ,y:631 , width:30 , height:30)
                Room109Button.frame = CGRect(x:314 ,y:541 , width:30 , height:30)
                
            }
            else if RoomData[row] == "Vettel"
            {
                BookRoomImage.image = RoomImages[row]

                Room101Button.frame = CGRect(x:71 ,y:158 , width:30 , height:30)
                Room102Button.frame = CGRect(x:71 ,y:247 , width:30 , height:30)
                Room103Button.frame = CGRect(x:71 ,y:322 , width:30 , height:30)
                Room104Button.frame = CGRect(x:71 ,y:406 , width:30 , height:30)
                Room105Button.frame = CGRect(x:117 ,y:412 , width:30 , height:30)
                Room106Button.frame = CGRect(x:192 ,y:631 , width:30 , height:30)
                Room107Button.frame = CGRect(x:236 ,y:631 , width:30 , height:30)
                Room108Button.frame = CGRect(x:274 ,y:631 , width:30 , height:30)
                Room109Button.frame = CGRect(x:319 ,y:631 , width:30 , height:30)
                Room110Button.isHidden = true
                RoomButton111Button.isHidden = true
            }
            else if RoomData[row] == "Cultural Living Center"
            {
                BookRoomImage.image = RoomImages[row]

                Room101Button.frame = CGRect(x:123 ,y:159 , width:30 , height:30)
                Room102Button.frame = CGRect(x:117 ,y:244 , width:30 , height:30)
                Room103Button.frame = CGRect(x:117 ,y:383 , width:30 , height:30)
                Room104Button.frame = CGRect(x:123 ,y:528 , width:30 , height:30)
                Room105Button.frame = CGRect(x:117 ,y:614 , width:30 , height:30)
                Room106Button.frame = CGRect(x:274 ,y:614 , width:30 , height:30)
                Room107Button.frame = CGRect(x:274 ,y:501 , width:30 , height:30)
                Room108Button.frame = CGRect(x:274 ,y:414 , width:30 , height:30)
                Room109Button.frame = CGRect(x:274 ,y:329 , width:30 , height:30)
                Room110Button.frame = CGRect(x:274 ,y:237 , width:30 , height:30)
                RoomButton111Button.frame = CGRect(x:274 ,y:159 , width:30 , height:30)
            }
            else if RoomData[row] == "Mako Hall"
            {
                BookRoomImage.image = RoomImages[row]

                Room101Button.frame = CGRect(x:68 ,y:264 , width:30 , height:30)
                Room102Button.frame = CGRect(x:68 ,y:314 , width:30 , height:30)
                Room103Button.frame = CGRect(x:68 ,y:379 , width:30 , height:30)
                Room104Button.frame = CGRect(x:68 ,y:439 , width:30 , height:30)
                Room105Button.frame = CGRect(x:68 ,y:519 , width:30 , height:30)
                Room106Button.frame = CGRect(x:125 ,y:455 , width:30 , height:30)
                Room107Button.frame = CGRect(x:125 ,y:379 , width:30 , height:30)
                Room108Button.frame = CGRect(x:125 ,y:314 , width:30 , height:30)
                Room109Button.frame = CGRect(x:181 ,y:169 , width:30 , height:30)
                Room110Button.frame = CGRect(x:236 ,y:169 , width:30 , height:30)
                RoomButton111Button.frame = CGRect(x:283 ,y:169 , width:30 , height:30)
            }
            else if RoomData[row] == "Rolling Hills A"
            {
                BookRoomImage.image = RoomImages[row]

                Room101Button.frame = CGRect(x:81 ,y:208 , width:30 , height:30)
                Room102Button.frame = CGRect(x:81 ,y:287 , width:30 , height:30)
                Room103Button.frame = CGRect(x:81 ,y:352 , width:30 , height:30)
                Room104Button.frame = CGRect(x:81 ,y:433 , width:30 , height:30)
                Room105Button.frame = CGRect(x:230 ,y:623 , width:30 , height:30)
                Room106Button.frame = CGRect(x:311 ,y:545 , width:30 , height:30)
                Room107Button.frame = CGRect(x:311 ,y:492 , width:30 , height:30)
                Room108Button.frame = CGRect(x:297 ,y:424 , width:30 , height:30)
                Room109Button.frame = CGRect(x:311 ,y:227 , width:30 , height:30)
                Room110Button.frame = CGRect(x:297 ,y:255 , width:30 , height:30)
                RoomButton111Button.frame = CGRect(x:311 ,y:185 , width:30 , height:30)
            }
            else
            {
                print("Not here yet")
                
            }
            print("key:", RoomKey[row])
            BuildingNameText.text = RoomData[row]
            keyIndex = row
            RoomSelected = true
        }
        else
        {
            FloorSelected = true
            Room101Button.setTitle( (String(FloorData[row]) + "01"), for: .normal)
            Room102Button.setTitle( (String(FloorData[row]) + "02"), for: .normal)
            Room103Button.setTitle( (String(FloorData[row]) + "03"), for: .normal)
            Room104Button.setTitle( (String(FloorData[row]) + "04"), for: .normal)
            Room105Button.setTitle( (String(FloorData[row]) + "05"), for: .normal)
            Room106Button.setTitle( (String(FloorData[row]) + "06"), for: .normal)
            Room107Button.setTitle( (String(FloorData[row]) + "07"), for: .normal)
            Room108Button.setTitle( (String(FloorData[row]) + "08"), for: .normal)
            Room109Button.setTitle( (String(FloorData[row]) + "09"), for: .normal)
            Room110Button.setTitle( (String(FloorData[row]) + "10"), for: .normal)
            RoomButton111Button.setTitle( (String(FloorData[row]) + "11"), for: .normal)
        }
        if RoomSelected == true && FloorSelected == true
        {
            DispatchQueue.main.async {
                self.Room101Button.backgroundColor = UIColor.gray
                self.Room102Button.backgroundColor = UIColor.gray
                self.Room103Button.backgroundColor = UIColor.gray
                self.Room104Button.backgroundColor = UIColor.gray
                self.Room105Button.backgroundColor = UIColor.gray
                self.Room106Button.backgroundColor = UIColor.gray
                self.Room107Button.backgroundColor = UIColor.gray
                self.Room108Button.backgroundColor = UIColor.gray
                self.Room109Button.backgroundColor = UIColor.gray
                self.Room110Button.backgroundColor = UIColor.gray
                self.RoomButton111Button.backgroundColor = UIColor.gray
                
            }
            print("Can call api now")
            selectedBuilding = RoomKey[keyIndex]
            print("key: ", RoomKey[keyIndex])
            //Call API
            var APIString = "http://nova.us-east-2.elasticbeanstalk.com/api/GetAvailableRoomsByFloor?BuildingName=" + RoomKey[keyIndex]+"&FloorNumber="+String(FloorData[row])
            //var APIString = "http://nova.us-east-2.elasticbeanstalk.com/api/GetAvailableRoomsByFloor?BuildingName=COM&FloorNumber=2"
            print("API call: ", APIString)
            let requestURL = URL(string: String(APIString))//1")
            var request = URLRequest(url:requestURL!)
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request)
            {
                
                (data: Data?, response: URLResponse?, error: Error?) in
                print("Entered here")
                if (error != nil)
                {
                    //self.displayAlert(message: "Couldn't perform at this time. Try again later")
                    print("error\(String(describing:error))")
                    return
                }
                print("Got pass almost there")
                //Converting data sent from server to our application
                
                do
                {
                    //print("Start")
                    let rooms = try
                        JSONDecoder().decode([Room].self, from: data!)
                    print(rooms)
                    //Turns all available rooms green
                    for room in rooms
                    {
                        //print("Iteration:", room)
                        if String(room.RoomNumber) == self.Room101Button.title(for: .normal)
                        {
                            DispatchQueue.main.async {
                                self.Room101Button.backgroundColor = UIColor.green
                            }
                        }
                        if String(room.RoomNumber) == self.Room102Button.title(for: .normal)
                        {
                            DispatchQueue.main.async {
                                self.Room102Button.backgroundColor = UIColor.green
                            }
                        }
                        if String(room.RoomNumber) == self.Room103Button.title(for: .normal)
                        {
                            DispatchQueue.main.async {
                                self.Room103Button.backgroundColor = UIColor.green
                            }
                        }
                        if String(room.RoomNumber) == self.Room104Button.title(for: .normal)
                        {
                            DispatchQueue.main.async {
                                self.Room104Button.backgroundColor = UIColor.green
                            }
                        }
                        if String(room.RoomNumber) == self.Room105Button.title(for: .normal)
                        {
                            DispatchQueue.main.async {
                                self.Room105Button.backgroundColor = UIColor.green
                            }
                        }
                        if String(room.RoomNumber) == self.Room106Button.title(for: .normal)
                        {
                            DispatchQueue.main.async {
                                self.Room106Button.backgroundColor = UIColor.green
                            }
                        }
                        if String(room.RoomNumber) == self.Room107Button.title(for: .normal)
                        {
                            DispatchQueue.main.async {
                                self.Room107Button.backgroundColor = UIColor.green
                            }
                        }
                        if String(room.RoomNumber) == self.Room108Button.title(for: .normal)
                        {
                            DispatchQueue.main.async {
                                self.Room108Button.backgroundColor = UIColor.green
                            }
                        }
                        if String(room.RoomNumber) == self.Room109Button.title(for: .normal)
                        {
                            DispatchQueue.main.async {
                                self.Room109Button.backgroundColor = UIColor.green
                            }
                        }
                        if String(room.RoomNumber) == self.Room110Button.title(for: .normal)
                        {
                            DispatchQueue.main.async {
                                self.Room110Button.backgroundColor = UIColor.green
                            }
                        }
                        if String(room.RoomNumber) == self.RoomButton111Button.title(for: .normal)
                        {
                            DispatchQueue.main.async {
                                self.RoomButton111Button.backgroundColor = UIColor.green
                            }
                        }
                    //print("Finished")
                    }
                }
                catch
                {
                    print("couldn't do error\(String(describing:error))")
                }
                
            
            }
            task.resume()
            
        }
        else
        {
            print("On init")
        }
    }
}
