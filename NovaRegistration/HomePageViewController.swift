//
//  HomePageViewController.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 3/31/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    //var welcomeMessageFinal = ""
    
    
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var imgArr =
    [
        UIImage(named: "nsuBuilding1"),
        UIImage(named: "nsuBuilding2"),
        UIImage(named: "nsuBuilding3"),
        UIImage(named: "nsuBuilding4"),
        UIImage(named: "nsuBuilding5"),
        UIImage(named: "nsuBuilding6"),
        UIImage(named: "nsuBuilding7")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //userNameTextField.text = "Welcome, " + welcomeMessageFinal
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignOutButtonPressed(_ sender: Any) {
        print("Sign out button pressed")
        self.dismiss(animated: true, completion: nil)
        /*
        let SignInViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.present(SignInViewController, animated: true)
        //let appDelegate = UIApplication.shared.delegate; appDelegate?.window??.rootViewController = SignInViewController
        print("Finished with function")
        */
        
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomePageViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return imgArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = imgArr[indexPath.row]
        }
        else if let ab = cell.viewWithTag(222) as? UIPageControl{
            ab.currentPage = indexPath.row
        }
        return cell
        //var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DataViewCollectionCell
        //cell?.img.image = UIImage(named: imgArr[indexPath.row])
        //cell?.lbl.text = imgArr[indexPath.row]
        //return cell!
        
    }
    
    
}

extension HomePageViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top:0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    func collectionView(_collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionView, minimumLineSpacingForSectionAt section: Int) ->CGFloat{
        return 0.0
    }
    func collectionView(_collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionView, minimumInneritemSpacingForSectionAt section: Int) ->CGFloat{
        return 0.0
    }
    
    
}
