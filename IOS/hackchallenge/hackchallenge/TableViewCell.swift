//
//  TableViewCell.swift
//  
//
//  Created by Brandon Joseph on 11/18/19.
//

import UIKit
import SnapKit
import GoogleMaps

class TableViewCell: UITableViewCell {

    var currentLocation: CLLocation?
    var bathroomName: UITextField!
    var bathroomDist: UITextField!
    var rating: UITextField!
    var building:  UITextField!
    
    let padding: CGFloat = 8
    let nameLabelHeight: CGFloat = 16
    let bathroomLabelHeight: CGFloat = 14
    
    
    let defaultLocation = CLLocation(latitude:  42.44851, longitude:  -76.47862)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          
          
          bathroomName = UITextField()
          bathroomName.isUserInteractionEnabled = true
          bathroomName.font = UIFont.systemFont(ofSize: 14)
          bathroomName.translatesAutoresizingMaskIntoConstraints = false
          contentView.addSubview(bathroomName)
          

         bathroomDist = UITextField()
         bathroomDist.isUserInteractionEnabled = true
         bathroomDist.font = UIFont.systemFont(ofSize: 14)
         bathroomDist.translatesAutoresizingMaskIntoConstraints = false
         contentView.addSubview(bathroomDist)
        
        
         rating = UITextField()
         rating.isUserInteractionEnabled = true
         rating.font = UIFont.systemFont(ofSize: 14)
         rating.translatesAutoresizingMaskIntoConstraints = false
         contentView.addSubview(rating)
        
        building = UITextField()
        building.isUserInteractionEnabled = true
        building.font = UIFont.systemFont(ofSize: 14)
        building.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(building)
        
        setupConstraints()
      }
    
    
        func setupConstraints() {
            bathroomName.snp.makeConstraints { make in
                make.leading.top.equalToSuperview().offset(padding)
                make.height.equalTo(nameLabelHeight)
            }
            building.snp.makeConstraints { make in
                make.leading.equalTo(bathroomName.snp.leading)
                make.top.equalTo(bathroomName.snp.bottom).offset(padding)
                make.height.equalTo(bathroomLabelHeight)
            }

            bathroomDist.snp.makeConstraints { make in
                make.leading.equalTo(bathroomName.snp.trailing).offset(padding)
                make.trailing.equalToSuperview().offset(-padding)
                make.top.height.equalTo(bathroomName)
            }
            rating.snp.makeConstraints { make in
                make.trailing.equalToSuperview().offset(-padding)
                make.top.equalTo(bathroomDist.snp.bottom).offset(padding)
                make.height.equalTo(bathroomLabelHeight)
            }
            
    }
    func configure(for building: Building) {
        bathroomName.text = building.name
        
        let coordinate0 = CLLocation(latitude: building.lat, longitude: building.long)
        let distanceInMeters = coordinate0.distance(from: defaultLocation)
        
        bathroomDist.text = "\(Double(round(100*distanceInMeters)/100))m"
//
//        building.text = "Building: " + building.B
//        rating.text = "Rating: \(building.Rating)"
        contentView.backgroundColor = UIColor.green.withAlphaComponent(0.1)
    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
