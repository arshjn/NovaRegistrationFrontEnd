//
//  HomePageViewController.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 3/31/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var HomePageNavBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SignOutButtonPressed(_ sender: Any) {
        Keychain.removePassword(service: "NovaRoomRegistration", account: "user")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func ReviewReservationPressed(_ sender: Any) {
        let ReviewViewController = self.storyboard?.instantiateViewController(withIdentifier: "ReviewViewController") as! ReviewViewController
        
        self.present(ReviewViewController, animated: true)
    }
    
    
    @IBAction func BookRoomButton(_ sender: Any) {
        print("Book room button pressed")
        let BackRoomViewController = self.storyboard?.instantiateViewController(withIdentifier:
              "BackRoomViewController") as! BackRoomViewController

        self.present(BackRoomViewController, animated: true)
    }
    @IBAction func ProfileButtonPressed(_ sender: Any) {
        print("Profile button pressed")
         let ProfilePageViewController = self.storyboard?.instantiateViewController(withIdentifier:
                     "ProfilePageViewController") as! ProfilePageViewController

               self.present(ProfilePageViewController, animated: true)
    }

}
