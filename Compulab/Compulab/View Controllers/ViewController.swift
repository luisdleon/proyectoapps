//
//  ViewController.swift
//  Compulab
//
//  Created by Luis De Leon on 2/1/20.
//  Copyright © 2020 Luis De Leon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements ()
    }

    func setUpElements (){
        
        Utilities.styleFilledButton(signUpBtn)
        Utilities.styleFilledButton(loginbtn)
    }
}

