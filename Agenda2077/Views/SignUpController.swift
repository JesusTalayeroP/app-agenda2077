//
//  SignUpController.swift
//  Agenda2077
//
//  Created by user176680 on 2/1/21.
//  Copyright © 2021 cev. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var emailTexField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LogInController.dismissKeyboard))
        // Do any additional setup after loading the view.
        
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        //Volver a la pantalla de LogIn
        if(!emailTexField.text!.isEmpty && (!passwordTextField.text!.isEmpty) == (!confirmPasswordTextField.text!.isEmpty)){
            let user = User.init(
                    username : emailTexField.text!,
                    email: emailTexField.text!,
                    name: emailTexField.text!,
                    surname: emailTexField.text!,
                    profilePic: emailTexField.text!,
                    password: passwordTextField.text!
                )
                
            Request.shared.postSignUp(user: user)
                        
                self.navigationController?.popToRootViewController(animated: true)

                    
            } else {
                print("Las contraseñas no coinciden")
            }

    }
    
    @IBAction func LogInButton(_ sender: Any) {
        //Volver a la pantalla de LogIn
        navigationController?.popToRootViewController(animated: true)

    }
    
    @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    

}
