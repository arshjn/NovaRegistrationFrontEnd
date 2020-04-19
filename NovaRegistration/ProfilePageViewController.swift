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
        var url = "http://nova.us-east-2.elasticbeanstalk.com/api/GetStudent/"
        
        
        /*
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.ChangeImage), userInfo: nil, repeats: true)
        }
        */
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
