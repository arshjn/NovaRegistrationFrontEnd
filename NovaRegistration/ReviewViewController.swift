//
//  ReviewViewController.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 4/22/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

import UIKit

class ReviewViewController:UIViewController
{
    @IBOutlet weak var RoomNumberText: UILabel!
    @IBOutlet weak var PriceText: UILabel!
    let keychain = Keychain()
    
    
    override func viewDidLoad() {
        let username = Keychain.loadPassword(service: "NovaRoomRegistration", account: "user")
        let url = "http://nova.us-east-2.elasticbeanstalk.com/api/GetReservation?NNumber="+username!
        let requestURL = URL(string: String(url))//1")
        var request = URLRequest(url:requestURL!)
        request.httpMethod = "GET"
        //request.addValue("application/json", forHTTPHeaderField: "content/json")
        //request.addValue("application/json", forHTTPHeaderField: "Accept")
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
                let room = try
                    JSONDecoder().decode(Room.self, from: data!)
                DispatchQueue.main.async {
                    self.RoomNumberText.text = self.RoomNumberText.text! + String(room.RoomNumber)
                    self.PriceText.text = self.PriceText.text! + "$" + String(room.Price)
                }

            }
            catch
            {
                print("couldn't do error\(String(describing:error))")
            }
        }
        task.resume()
        
    }
    
    @IBAction func BackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

