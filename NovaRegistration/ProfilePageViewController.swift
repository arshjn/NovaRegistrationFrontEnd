//
//  ProfilePageViewController.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 4/14/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController {
    
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
        // Do any additional setup after loading the view.
    }

    //@IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBAction func pageView(_ sender: Any) {
        
    }
    
}
/*
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
*/
