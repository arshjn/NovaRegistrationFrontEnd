//
//  HomePageViewController.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 3/31/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UILabel!
    //var welcomeMessageFinal = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //userNameTextField.text = "Welcome, " + welcomeMessageFinal
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignOutButtonPressed(_ sender: Any) {
        print("Sign out button pressed")
        /*
        let SignInViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.present(SignInViewController, animated: true)
        //let appDelegate = UIApplication.shared.delegate; appDelegate?.window??.rootViewController = SignInViewController
        print("Finished with function")
        */
    }
    
    @IBAction func BookRoomButton(_ sender: Any) {
        print("Book room button pressed")
    }
    @IBAction func ProfileButtonPressed(_ sender: Any) {
        print("Profile button pressed")
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
