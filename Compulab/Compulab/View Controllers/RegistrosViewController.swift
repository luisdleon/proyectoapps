//
//  RegistrosViewController.swift
//  Compulab
//
//  Created by Luis De Leon on 2/18/20.
//  Copyright © 2020 Luis De Leon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class RegistrosViewController: UIViewController {
var ref: DatabaseReference!
    @IBOutlet weak var descripciontxtfield: UITextField!
    @IBOutlet weak var fechatxtfield: UITextField!
    @IBOutlet weak var serietxtfield: UITextField!
    @IBOutlet weak var modelotxtfield: UITextField!
    @IBOutlet weak var nombretxtfield: UITextField!
    @IBOutlet weak var registrarbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
      
        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements() {
        
        
        Utilities.styleTextField(nombretxtfield)
        Utilities.styleTextField(modelotxtfield)
        Utilities.styleTextField(serietxtfield)
        Utilities.styleTextField(fechatxtfield)
        Utilities.styleTextField(descripciontxtfield)
        Utilities.styleFilledButton(registrarbtn)
    }
    
    @IBAction func registrarTapped(_ sender: Any) {
        ref?.child("Registros").childByAutoId().setValue(["Nombre": nombretxtfield.text,"Modelo":modelotxtfield.text,"Numero de Serie":serietxtfield.text,"Fecha":fechatxtfield.text,"Descripcion":descripciontxtfield.text])
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
