//
//  ProfilePageViewController.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 4/14/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

import UIKit

struct Student:Decodable
{
    let NNumber: Int
    let FirstName: String
    let LastName: String
    let Sex: String
    let Level: String
    let RazersEdge: Bool?
    let Athlete: Bool?
}
/*
class datas: ObservableObject
{
    @Published var jsonData = []
}
*/
class ProfilePageViewController: UIViewController {

    @IBOutlet weak var FirstNameText: UILabel!
    @IBOutlet weak var LastNameText: UILabel!
    @IBOutlet weak var SexText: UILabel!
    @IBOutlet weak var GradeText: UILabel!
    
    @IBAction func BackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    let keyChain = Keychain()
    
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
    var timer = Timer()
    var counter = 0
    
    @objc func ChangeImage()
    {
        if counter < imgArr.count
        {
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter = counter + 1
        }
        else
        {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Call API to get student's info
        let username = KeyChain.loadPassword(service: "NovaRoomRegistration", account: "user")
        print("username:", username)
        var url = "http://nova.us-east-2.elasticbeanstalk.com/api/GetStudent/"+username!
        let requestURL = URL(string: String(url))//1")
        var request = URLRequest(url:requestURL!)
        request.httpMethod = "GET"
        //request.addValue("application/json", forHTTPHeaderField: "content/json")
        //request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request)
        {
            
            (data: Data?, response: URLResponse?, error: Error?) in
            print("Entered here")
            if (error != nil)
            {
                print("error\(String(describing:error))")
                return
            }
            print("Got pass almost there")
            //Converting data sent from server to our application
            
            do
            {
                print("Before")
                print("Start")
                
                let Json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Any
                print(Json)
                
                
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
        

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var pageView: UIPageControl!
    
}
extension ProfilePageViewController:UICollectionViewDelegate, UICollectionViewDataSource{
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
        
    }
    
    
}

extension ProfilePageViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top:0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    func collectionView(_collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionView, minimumLineSpacingForSectionAt section: Int) ->CGFloat{
        return 0.0
    }
    func collectionView(_collectionView: UICollectionView, layout UICollectionViewLayout: UICollectionView, minimumInneritemSpacingForSectionAt section: Int) ->CGFloat{
        return 0.0
    }
    
    
}
