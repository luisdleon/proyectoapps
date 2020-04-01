//
//  HistorialViewController.swift
//  Compulab
//
//  Created by Luis De Leon on 3/10/20.
//  Copyright © 2020 Luis De Leon. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HistorialViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

      
      
      @IBOutlet weak var tableView: UITableView!
      var postData = [String]()
      var ref: DatabaseReference!
      var databaseHandle: DatabaseHandle!

      override func viewDidLoad() {
          super.viewDidLoad()
          
          tableView.delegate = self
          tableView.dataSource = self
          ref = Database.database().reference()
          // Do any additional setup after loading the view.
          
          databaseHandle = ref?.child("Modelo").observe(.childAdded, with: { (DataSnapshot) in
              
              let post = DataSnapshot.value as? String
              
              if let actualpost = post {
                  self.postData.append(actualpost)
                  self.tableView.reloadData()
              }
              
          })
      }
      
      override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return postData.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
          cell?.textLabel?.text = postData[indexPath.row]
          
          return cell!
          
      }
    }
