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
    var welcomeMessage = ""
    
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
        
        
        
        //Format the string needed to proper format to login
        
        //Formatting the HTTP Request
        //var requestURL = URLComponents(string: "http://nova.us-east-2.elasticbeanstalk.com/api/")
        //requestURL.queryItems[(NNumber: username, Pass: password)]
        var url = "http://nova.us-east-2.elasticbeanstalk.com/api/User?NNumber="+username!+"&Pass="+password!;
        print("url:", url)
        let requestURL = URL(string: String(url))//1")
        //requestURL += username
        //print("RequestURL", requestURL)
        var request = URLRequest(url:requestURL!)
        request.httpMethod = "POST"
        //request.addValue("application/json", forHTTPHeaderField: "content/json")
        //request.addValue("application/json", forHTTPHeaderField: "Accept")
        //let sendString = ["userName": username!,
        //                  "password": password!] as [String:String]
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
                let Json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Bool
                print("Before")
                print(Json)
                if Json == true{
                    print("Can login")
                    DispatchQueue.main.async {
                        //Saving key to keychain
                        KeychainItemWrapper  self.userNameTextField.text
                        
                        
                        
                        //Clearing user and password text fields
                        self.userNameTextField.text?.removeAll()
                        self.passwordTextField.text?.removeAll()
                        //Continuing to next page
                        let HomePageViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
                        
                        self.present(HomePageViewController, animated: true)
                    }
                }
                else{
                    print("Cannot come outside")
                    self.displayAlert(message: "Username or password is incorrect. Please try again")
                }
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
        /*
        print("Got HERRE")
        if canpass == true {
        print("Entered!!!")
        self.welcomeMessage = username!
        performSegue(withIdentifier: "SegToHome", sender: self)
        //let passAuthentication = false
        //go to next page
        let HomePageViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
        
        self.present(HomePageViewController, animated: true)
        }
        */
        task.resume()
        
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //var hvc = segue.destination as! HomePageViewController
        //hvc.welcomeMessageFinal = self.welcomeMessage
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
