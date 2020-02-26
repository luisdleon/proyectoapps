//
//  SignUpViewController.swift
//  Compulab
//
//  Created by Luis De Leon on 2/1/20.
//  Copyright © 2020 Luis De Leon. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class SignUpViewController: UIViewController {

    @IBOutlet weak var NombreTextField: UITextField!
    @IBOutlet weak var apellidoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var rangoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var sigupButton: UIButton!
    
    @IBOutlet weak var errorlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        errorlabel.alpha = 0
        
        Utilities.styleTextField(NombreTextField)
        Utilities.styleTextField(apellidoTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleTextField(rangoTextField)
        Utilities.styleFilledButton(sigupButton)
        
    }
    
    

    func validateFields() -> String? {
        
        if NombreTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            apellidoTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            rangoTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Rellena todos los campos"
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Asegurate que tu contraaseña sea de 8 caracteres, un numero o un signo especial"
        
        }
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            
           
                
            
            showError (error!)
        }
        
        else {
            
            let nombre = NombreTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                       let apellido = apellidoTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                       let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let rango = rangoTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
                       let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                       
                       
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
                
                if error != nil {
                    self.showError("Error al crear usuario")
                    
                }
                else {
                    
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data:[ "Nombre": nombre,"apellido":apellido,"uid":result!.user.uid]) { (error) in
                        
                        if error != nil {
                            self.showError("Error guardando datos")
                        }
                    }
                    self.transitiontoHome()
                    
                }
            }
        }
        
    }
    func showError(_ message: String){
        
        errorlabel.text = message
        errorlabel.alpha = 1
    }
    func transitiontoHome () {
       let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }

}
