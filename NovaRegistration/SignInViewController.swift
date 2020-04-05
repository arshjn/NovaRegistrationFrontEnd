//
//  SignInViewController.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 3/31/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    func displayAlert(message:String)->Void{
        DispatchQueue.main.async{
            let alertController = UIAlertController(title:"Alert", message:message, preferredStyle: .alert)
            let OKAction = UIAlertAction(title:"Ok", style: .default){
                (action:UIAlertAction!) in
                print("Ok Button pressed")
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func removeActivityIndicator(activityIndicator: UIActivityIndicatorView)
    {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInButtonPressed(_ sender: Any) {
        print("Sign in button pressed")
        //Checks the fields and see if they are empty
        if (userNameTextField.text?.isEmpty)! ||
            (passwordTextField.text?.isEmpty)!
        {
            //Display warning
            displayAlert(message: "Username or password is empty")
            return
        }
        
        //Obtaining values from input fields
        let username = userNameTextField.text
        let password = passwordTextField.text
        
        
        //Activity indicator
        let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        
        
        //position on screen
        myActivityIndicator.center = view.center
        myActivityIndicator.hidesWhenStopped = false
        
        myActivityIndicator.startAnimating()
        
        view.addSubview(myActivityIndicator)
        
        
        
        
        //Formatting the HTTP Request
        let requestURL = URL(string: "http://nova.us-east-2.elasticbeanstalk.com/api/Student/ID/1")
        var request = URLRequest(url:requestURL!)
        request.httpMethod = "GET"
        //request.addValue("application/json", forHTTPHeaderField: "content/json")
        //request.addValue("application/json", forHTTPHeaderField: "Accept")
        let sendString = ["userName": username!,
                          "password": password!] as [String:String]
        
        /*
        do
        {
            request.httpBody = try JSONSerialization.data(withJSONObject: sendString, options: .prettyPrinted)
        }
        catch let error
        {
            print(error.localizedDescription)
        }
        */
        
        let task = URLSession.shared.dataTask(with: request)
        {
            
            (data: Data?, response: URLResponse?, error: Error?) in
            self.removeActivityIndicator(activityIndicator:myActivityIndicator)
            
            print("Entered here")
            if (error != nil)
            {
                self.displayAlert(message: "Couldn't perform at this time. Try again later")
                print("error\(String(describing:error))")
                return
            }
            print("Got pass almost there")
            //Converting data sent from server to our application
            do
            {
                let Json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? String
                print("Before")
                print(Json)
                print("After")
                /*
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
                self.removeActivityIndicator(activityIndicator: myActivityIndicator)
                self.displayAlert(message: "Couldn't do")
                print("couldn't do error\(String(describing:error))")
            }
            
            
        }

        task.resume()
         
        
        //let passAuthentication = false
        //go to next page
        let HomePageViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
        
        self.present(HomePageViewController, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
