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

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LogInController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    
    @IBAction func RecoverPasswordButton(_ sender: Any) {
        //Volver a la pantalla de LogIn
        if(!emailTextField.text!.isEmpty){
            let parameters = [
                "username" : emailTextField.text!,
                "email" : emailTextField.text!
            ]
            
            let request = Request.shared.postRecoverPassword(parameters: parameters)
            
            request.responseJSON{ response in
            
                if(response.response!.statusCode == 200 && response.value! as! String != "Wrong email"){
                let title = response.value!
                
                // ALERTAAAA
                // CAMPBIAR POR FUNCION SI DA TIEMPO
                // TIENE QUE DAR TIEMPO
                // Al final no dio tiempo (spoiler jeje)
                let alert = UIAlertController(title: "Your new password is " + (title as! String), message: "Log in to the app and change your password in your profile", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {action in self.navigationController?.popToRootViewController(animated: true)}))
                self.present(alert, animated: true)
                
                } else {
                    let alert = UIAlertController(title: "Wrong email", message: "The introduced email is not registered in the app", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            }
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
