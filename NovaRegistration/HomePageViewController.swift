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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignOutButtonPressed(_ sender: Any) {
        print("Sign out button pressed")
    }
    
    @IBAction func LoadDetailsButton(_ sender: Any) {
        print("Load details button pressed")
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
