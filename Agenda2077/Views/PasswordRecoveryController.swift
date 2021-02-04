//
//  PasswordRecoveryController.swift
//  Agenda2077
//
//  Created by user176680 on 2/1/21.
//  Copyright © 2021 cev. All rights reserved.
//

import UIKit

class PasswordRecoveryController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func RecoverPasswordButton(_ sender: Any) {
        //Volver a la pantalla de LogIn
        if(!emailTextField.text!.isEmpty){
            let parameters = [
                "username" : emailTextField.text!,
                "email" : emailTextField.text!
            ]
            
            Request.shared.postRecoverPassword(parameters: parameters)
            
            self.navigationController?.popToRootViewController(animated: true)
        }
       
    }
    
    @IBAction func LogInButton(_ sender: Any) {
        //Volver a la pantalla de LogIn
        navigationController?.popToRootViewController(animated: true)

    }
}
