//
//  ProfilePageViewController.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 4/14/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController {

    @IBOutlet weak var FirstNameText: UILabel!
    @IBOutlet weak var LastNameText: UILabel!
    @IBOutlet weak var SexText: UILabel!
    @IBOutlet weak var GradeText: UILabel!
    
    @IBAction func BackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    let keyChain = Keychain()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Call API to get student's info
        let username = Keychain.loadPassword(service: "NovaRoomRegistration", account: "user")
        let url = "http://nova.us-east-2.elasticbeanstalk.com/api/GetStudent?NNumber="+username!
        let requestURL = URL(string: String(url))
        var request = URLRequest(url:requestURL!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request)
        {
            (data: Data?, response: URLResponse?, error: Error?) in
            if (error != nil)
            {
                print("error\(String(describing:error))")
                return
            }
            print("Got pass almost there")
            //Converting data sent from server to our application
            do
            {
                let student = try
                    JSONDecoder().decode(Student.self, from: data!)
                print(student)
                DispatchQueue.main.async {
                    self.FirstNameText.text = self.FirstNameText.text! + student.FirstName
                    self.LastNameText.text = self.LastNameText.text! + student.LastName
                    self.SexText.text = self.SexText.text! + student.Sex
                    self.GradeText.text = self.GradeText.text! + student.Level
                }

            }
            catch
            {
                print("couldn't do error\(String(describing:error))")
            }
        }
        task.resume()
    }
    
}

