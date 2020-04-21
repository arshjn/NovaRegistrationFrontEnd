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
        UIImage(named: "FloorPlan4"),
        UIImage(named: "FloorPlan5"),
        UIImage(named: "FloorPlan6"),
        UIImage(named: "FloorPlan7"),
        UIImage(named: "FloorPlan8")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Room101Button.backgroundColor = UIColor.darkGray
        Room101Button.layer.cornerRadius = 15
        
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
        
        FloorData = [1,2,3,4]
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
            return String(FloorData[row])
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == RoomSelector
        {
            print("Title:", RoomData[row])
            if RoomData[row] == "Leo Goodwin Sr. Residence Hall"
            {
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
            BuildingNameText.text = RoomData[row]
            keyIndex = row
            RoomSelected = true
        }
        else
        {
            FloorSelected = true
        }
        if RoomSelected == true && FloorSelected == true
        {
            print("Can call api now")
            print("key: ", RoomKey[keyIndex])
            //Call API
            //var APIString = "http://nova.us-east-2.elasticbeanstalk.com/api/Project?BuildingName=" + RoomKey[keyIndex]+"&FloorNumber="+String(FloorData[row])
            var APIString = "http://nova.us-east-2.elasticbeanstalk.com/api/Project?BuildingName=COM&FloorNumber=1"
            print("API call: ", APIString)
            let requestURL = URL(string: String(APIString))//1")
            var request = URLRequest(url:requestURL!)
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request)
            {
                
                (data: Data?, response: URLResponse?, error: Error?) in
                //self.removeActivityIndicator(activityIndicator:myActivityIndicator)
                
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
                    print("Start")
                    let rooms = try
                        JSONDecoder().decode([Room].self, from: data!)
                    print("RN", rooms[0].RoomNumber)//  .RoomNumber)
                    //print("title:", self.Room101Button.title(for: <#T##UIControl.State#>))
                    if 101 == rooms[0].RoomNumber
                    {
                        print("Here")
                        DispatchQueue.main.async {
                            self.Room101Button.backgroundColor = UIColor.red
                        }
                        
                    }
                    //guard let Json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] else { print(type(of: Json)); return }
                    //let Json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? Any
                    print("Before")
                    //print("type of", type(of: Json))
                    //print(Json)
                    //let room = Room(json: Json)
                    //print("RN:", room.RoomNumber)
                    
                    /*
                    if let parseJSON == Json
                    {
                        let roomNumber = parseJSON["RoomNumber"] as String?
                        print("roomNumber", roomNumber)
                    }
                    */
                    /*
                    if Json == true{
                        print("Can login")
                        DispatchQueue.main.async {
                            let HomePageViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
                            
                            self.present(HomePageViewController, animated: true)
                        }
                    }
                    else{
                        print("Cannot come outside")
                        self.displayAlert(message: "Username or password is incorrect. Please try again")
                    }
                    print("After")
                    
                    if let parseJson = Json
                    {
                        let userID = parseJson["userID"] as? String
                        print("User ID: \(String(describing: userID!))")
                        if(userID?.isEmpty)!
                        {
                            self.displayAlert(message: "Couldn't perform at this time")
                            return
                        }
                        else
                        {
                            self.displayAlert(message: "Signed in")
                        }
                    }
                    else
                    {
                        self.displayAlert(message: "Couldn't perform")
                    }
                    */
                }
                catch
                {
                    //self.removeActivityIndicator(activityIndicator: myActivityIndicator)
                    //self.displayAlert(message: "Couldn't do")
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
/*
class datas: ObservableObject
{
    @Published var jsonData = []
}
 */
struct Room: Decodable
{
    let RoomNumber: Int
    var Price: Int
    var Student1: Int?
    var Student2: Int?
    var Student3: Int?
    var Student4: Int?
    
    /*
    init(json: Any)
    //init(from: Decoder) throws
    {
        RoomNumber = 1
        Price = 1
        Student1 = 1
        Student2 = 1
        Student3 = 1
        Student4 = 1
        /*
        RoomNumber = json["RoomNumber"] as? Int ?? -1
        Price = json["Price"] as? Double ?? -1.0
        Student1 = json["Occupant1"] as? Int ?? -1
        Student2 = json["Occupant2"] as? Int ?? -1
        Student3 = json["Occupant3"] as? Int ?? -1
        Student4 = json["Occupant4"] as? Int ?? -1
        */
    }
 */
}
/*
struct Result: Decodable
{
    let results: [Room]
}
 */
