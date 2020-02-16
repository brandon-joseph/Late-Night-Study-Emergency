//
//  FloorPlanViewController.swift
//  hackchallenge
//
//  Created by Brandon Joseph on 12/8/19.
//  Copyright © 2019 Appdev. All rights reserved.
//

import UIKit
import GoogleMaps
import SnapKit

class FloorPlanViewController: UIViewController {

    var building: Building!
    var bottombar = UIView()
    
    
    var floor1: UIButton!
    var floor2: UIButton!
    var floor3: UIButton!
    
    var floorplan: UIImageView!

    
    let clicked =  UIColor(red: 249.0/255.0, green: 87.0/235.0, blue: 56.0/255.0, alpha: 1.0)
    let bg = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 212.0/255.0, alpha: 1.0)
          
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

     
        view.backgroundColor = bg

         self.navigationItem.title = "Floors"
        
        
        //THIS CODE WAS FOR LOGO AT TOP
//        let logo = UIImage(named: "logoalt")
//        let imageView = UIImageView(image:logo)
//        imageView.contentMode = UIView.ContentMode.scaleAspectFit
//        self.navigationItem.titleView = imageView
//
        
        
        
        bottombar = UIView(frame: CGRect(
            origin: CGPoint(x: view.frame.minX , y: view.frame.maxY-85),
            size: CGSize(width: 1000, height: 200)))
        bottombar.backgroundColor = UIColor(red: 238.0/255.0, green: 150.0/235.0, blue: 76.0/255.0, alpha: 1.0)
        view.addSubview(bottombar)
        
        floor1 = UIButton()
        floor1.translatesAutoresizingMaskIntoConstraints = false
        floor1.setTitle("1st Floor", for: .normal)
        floor1.layer.backgroundColor =  clicked.cgColor
        floor1.setTitleColor(bg, for: .normal)
        
        floor1.layer.cornerRadius = 8
        floor1.clipsToBounds = true
        floor1.addTarget(self, action: #selector(pushFloor1), for: .touchUpInside)

        
         floor2 = UIButton()
         floor2.translatesAutoresizingMaskIntoConstraints = false
         floor2.setTitle("2nd Floor", for: .normal)
         floor2.setTitleColor(.red, for: .normal)
         floor2.layer.backgroundColor = bg.cgColor
         floor2.layer.cornerRadius = 8
         floor2.clipsToBounds = true
         floor2.addTarget(self, action: #selector(pushFloor2), for: .touchUpInside)


        

         floor3 = UIButton()
         floor3.translatesAutoresizingMaskIntoConstraints = false
         floor3.setTitle("3rd Floor", for: .normal)
         floor3.setTitleColor(.red, for: .normal)
         floor3.layer.backgroundColor = bg.cgColor
         floor3.layer.cornerRadius = 8
         floor3.clipsToBounds = true
         floor3.addTarget(self, action: #selector(pushFloor3), for: .touchUpInside)



         floorplan = UIImageView()
         floorplan.image = UIImage(named: "floorplan1")
         floorplan.contentMode = UIView.ContentMode.scaleAspectFit
         view.addSubview(floorplan)
    

        
       // floor1.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        view.addSubview(floor1)
        view.addSubview(floor2)
        view.addSubview(floor3)

        setupConstraints()
        
    }
      func setupConstraints() {
            floor1.snp.makeConstraints { make in
                make.bottom.equalTo(-20)
                make.leading.equalTo(30)
                make.height.equalTo(50)
                make.width.equalTo(100)
                 
            }
        floor2.snp.makeConstraints { make in
            make.bottom.equalTo(-20)
            make.leading.equalTo(floor1.snp.trailing).offset(30)
            make.height.equalTo(50)
            make.width.equalTo(100)
             
        }
        floor3.snp.makeConstraints { make in
            make.bottom.equalTo(-20)
            make.leading.equalTo(floor2.snp.trailing).offset(30)
            make.height.equalTo(50)
            make.width.equalTo(100)
             
        }
          
        floorplan.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
                
        }
    @objc func pushFloor1() {
        if floor1.layer.backgroundColor == bg.cgColor {
            floor1.layer.backgroundColor =  clicked.cgColor
            floor1.setTitleColor(bg, for: .normal)
            
            floor2.layer.backgroundColor =  bg.cgColor
            floor2.setTitleColor(.red, for: .normal)
            
            floor3.layer.backgroundColor =  bg.cgColor
            floor3.setTitleColor(.red, for: .normal)
            
            floorplan.image = UIImage(named: "floorplan1")
            
            
        } else {
            floor1.layer.backgroundColor =  bg.cgColor
            floor1.setTitleColor(.red, for: .normal)
        }
     
        //present(viewController, animated: true, completion: nil)
    }
    @objc func pushFloor2() {
        if floor2.layer.backgroundColor == bg.cgColor {
            floor2.layer.backgroundColor =  clicked.cgColor
            floor2.setTitleColor(bg, for: .normal)
            
            floor1.layer.backgroundColor =  bg.cgColor
            floor1.setTitleColor(.red, for: .normal)
            
            floor3.layer.backgroundColor =  bg.cgColor
            floor3.setTitleColor(.red, for: .normal)
            
            floorplan.image = UIImage(named: "floorplan2")
        } else {
            floor2.layer.backgroundColor =  bg.cgColor
            floor2.setTitleColor(.red, for: .normal)
        }
     
        //present(viewController, animated: true, completion: nil)
    }
    @objc func pushFloor3() {
        if floor3.layer.backgroundColor == bg.cgColor {
            floor3.layer.backgroundColor =  clicked.cgColor
            floor3.setTitleColor(bg, for: .normal)
            
            floor2.layer.backgroundColor =  bg.cgColor
            floor2.setTitleColor(.red, for: .normal)
            
            floor1.layer.backgroundColor =  bg.cgColor
            floor1.setTitleColor(.red, for: .normal)
            
            floorplan.image = UIImage(named: "floorplan3")
        } else {
            floor3.layer.backgroundColor =  bg.cgColor
            floor3.setTitleColor(.red, for: .normal)
        }
     
        //present(viewController, animated: true, completion: nil)
    }
    

}
