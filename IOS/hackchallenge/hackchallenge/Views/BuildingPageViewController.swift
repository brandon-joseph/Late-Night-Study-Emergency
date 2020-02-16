//
//  BuildingPageViewController.swift
//  hackchallenge
//
//  Created by Brandon Joseph on 11/21/19.
//  Copyright © 2019 Appdev. All rights reserved.
//

import UIKit
import GoogleMaps
import SnapKit

class BuildingPageViewController: UIViewController {
    var building: Building!
    var name: UITextField!
    var bathrooms: [Bathroom] = []
    var vending: [Vending] = []
    var lat: Double = 0
    var long: Double = 0
    var dist: UITextField!
    
    var Where: UITextField!
    var desc: UITextField!
    var logistics: UITextField!
    var logdesc: UITextField!
    
     var rating: UITextField!
    var ratingNum: UITextField!
    
     var starView: UIImageView!
    
    var floors: UIBarButtonItem!
    
    let padding: CGFloat = 8
    let nameLabelHeight: CGFloat = 16
    let bathroomLabelHeight: CGFloat = 36
    
    let defaultLocation = CLLocation(latitude:  42.44851, longitude:  -76.47862)
    
    var img: UIImageView!
    
    init(building: Building) {
          self.building = building
          super.init(nibName: nil, bundle: nil)
      }
    // This function is required, you can ignore it
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Floors", style: .plain, target: self, action: #selector(pushNavViewController))

          let bg = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 212.0/255.0, alpha: 1.0)
        
        let textc = UIColor(red: 249.0/255.0, green: 87.0/235.0, blue: 56.0/255.0, alpha: 1.0)
          view.backgroundColor = bg
          name = UITextField()
          name.isUserInteractionEnabled = false
          name.font = UIFont.systemFont(ofSize: 20)
         // name.translatesAutoresizingMaskIntoConstraints = false
          name.text = building.name
          name.textColor = textc
          view.addSubview(name)
          
        img = UIImageView()
        img.image = UIImage(named: "bathroomplace")
        img.contentMode = UIView.ContentMode.scaleAspectFit
        view.addSubview(img)
        
        
                
        let coordinate0 = CLLocation(latitude: building.lat, longitude: building.long)
        let distanceInMeters = coordinate0.distance(from: defaultLocation)
        
        dist = UITextField()
        dist.font = UIFont.systemFont(ofSize: 12)
        dist.textColor = textc
        dist.text = "\(Double(round(100*distanceInMeters)/100))m away"
        //
        view.addSubview(dist)
        
 
        let misc = [0,0.5,1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0]
        let rat = misc.randomElement()!
        
        rating = UITextField()
        rating.font = UIFont.systemFont(ofSize: 24)
        rating.textColor = textc
//        rating.text =
//        """
//        Overall Rating
//
//        \(Double(building.bathrooms[0].rating))
//        """
        rating.text = "Overall Rating"
        view.addSubview(rating)
        
        ratingNum = UITextField()
        ratingNum.font = UIFont.systemFont(ofSize: 40)
        ratingNum.textColor = UIColor(red: 237.0/255.0, green: 162.0/235.0, blue: 98.0/255.0, alpha: 1.0)
        ratingNum.text = "\(rat)"
        view.addSubview(ratingNum)
        
        
        Where = UITextField()
        Where.font = UIFont.systemFont(ofSize: 24)
        Where.textColor = textc
        Where.text = "Where"
        view.addSubview(Where)
            
        desc = UITextField()
        desc.font = UIFont.systemFont(ofSize: 20)
        desc.textColor =  UIColor(red: 237.0/255.0, green: 162.0/235.0, blue: 98.0/255.0, alpha: 1.0)
        desc.text = "Between rooms 120 and 121"
        view.addSubview(desc)
             
        logistics = UITextField()
        logistics.font = UIFont.systemFont(ofSize: 24)
        logistics.textColor = textc
        logistics.text = "Logistics"
        view.addSubview(logistics)
        
    
        
        
        let number = Int.random(in: 0 ..< 5)
        
        let conditions = ["Poor", "Okay", "Good", "Great", "Perfect"]
        let cond = conditions.randomElement()!
        
        logdesc = UITextField()
        logdesc.font = UIFont.systemFont(ofSize: 20)
        logdesc.textColor =  UIColor(red: 237.0/255.0, green: 162.0/235.0, blue: 98.0/255.0, alpha: 1.0)
        logdesc.text = "Number of Stalls: \(number) | Condition: \(cond)"
        view.addSubview(logdesc)
        
        let starimg = UIImage(named: toStar(star: rat))
        
        starView = UIImageView()
        starView.image = starimg
        starView.contentMode = UIView.ContentMode.scaleAspectFit
        view.addSubview(starView)
        
        
        
        // Do any additional setup after loading the view.
        setupConstraints()
        
    }
    
    @objc func pushNavViewController() {
        let newViewController = FloorPlanViewController(building: building)
        self.navigationController?.pushViewController(newViewController, animated: true)
        //present(viewController, animated: true, completion: nil)
    }
    
    
    func setupConstraints() {
        name.snp.makeConstraints { make in
            make.top.equalTo(100)
             make.centerX.equalTo(view)
        }
        
        img.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(-120)
        //    make.centerX.equalToSuperview()
            make.leading.equalTo(150).offset(100)
            make.trailing.equalTo(150).offset(-100)
//            make.centerY.equalToSuperview()
//            make.height.equalTo(img.image!.size.height)
         }
        dist.snp.makeConstraints { make in
            make.top.equalTo(img.snp.bottom).offset(-130)
            make.centerX.equalToSuperview()

         }
        Where.snp.makeConstraints { make in
             make.top.equalTo(dist.snp.bottom).offset(30)
             make.centerX.equalToSuperview()

          }
        desc.snp.makeConstraints { make in
                  make.top.equalTo(Where.snp.bottom).offset(30)
                  make.centerX.equalToSuperview()
                make.height.equalTo(20)
               }
        logistics.snp.makeConstraints { make in
             make.top.equalTo(desc.snp.bottom).offset(30)
             make.centerX.equalToSuperview()

          }
        logdesc.snp.makeConstraints { make in
                  make.top.equalTo(logistics.snp.bottom).offset(30)
                  make.centerX.equalToSuperview()
                make.height.equalTo(20)
               }
        
        rating.snp.makeConstraints { make in
             make.bottom.equalTo(-150)
             make.centerX.equalTo(view)
          }
        ratingNum.snp.makeConstraints { make in
                 make.top.equalTo(rating.snp.bottom).offset(10)
                 make.centerX.equalToSuperview()
               make.height.equalTo(40)
            }
        starView.snp.makeConstraints { make in
                     make.top.equalTo(ratingNum.snp.bottom).offset(0)
                     make.centerX.equalToSuperview()
                   make.height.equalTo(40)
    }

    }
    
    func toStar(star: Double) -> String {
        if (star == 0.0) {return "0"}
        if (star == 0.5) {return "0a"}
        if (star == 1.0) {return "1"}
        if (star == 1.0) {return "1a"}
        if (star == 2.0) {return "2"}
        if (star == 2.5) {return "2a"}
        if (star == 3.0) {return "3"}
        if (star == 3.5) {return "3a"}
        if (star == 4.0) {return "4"}
        if (star == 4.5) {return "4a"}
        if (star == 5.0) {return "5"}
        return ""


}
  
}
