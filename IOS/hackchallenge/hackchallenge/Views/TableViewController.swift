//
//  TableViewController.swift
//  hackchallenge
//
//  Created by Brandon Joseph on 11/19/19.
//  Copyright © 2019 Appdev. All rights reserved.
//

import UIKit
import GoogleMaps

class TableViewController: UIViewController {

    var tableView: UITableView!
    var buildings: [Building]
   let defaultLocation = CLLocation(latitude:  42.44851, longitude:  -76.47862)
    let reuseIdentifier = "TableViewCellReuse"
    
    init(bathrooms: [Building]) {
          self.buildings = bathrooms
          super.init(nibName: nil, bundle: nil)
      }

      // This function is required, you can ignore it
      required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
          tableView = UITableView()
           tableView.allowsSelection = false
           tableView.delegate = self
           tableView.dataSource = self
           tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
           tableView.tableFooterView = UIView() // so there's no empty lines at the bottom
           view.addSubview(tableView)
         
         setupConstraints()
        sortList()
        // Do any additional setup after loading the view.
    }
    func sortList() {
        let test = self.buildings.sorted() {(CLLocation(latitude: $0.lat, longitude: $0.long).distance(from: defaultLocation))  < (CLLocation(latitude: $1.lat, longitude: $1.long).distance(from: defaultLocation))}
       buildings = test
       tableView.reloadData();
    }
        
    
    
    func setupConstraints() {
               tableView.snp.makeConstraints { make in
                   make.edges.equalToSuperview()
               }
    }
}
    


extension TableViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell
        cell.configure(for: buildings[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildings.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}


