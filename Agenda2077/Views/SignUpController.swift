//
//  SignUpController.swift
//  Agenda2077
//
//  Created by user176680 on 2/1/21.
//  Copyright © 2021 cev. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var agreeChecker: UISwitch!
    
    @IBOutlet weak var errorTermsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LogInController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        //Validaciones
        if(!emailTextField.text!.isEmpty && !passwordTextField.text!.isEmpty && !confirmPasswordTextField.text!.isEmpty && !usernameTextField.text!.isEmpty && !nameTextField.text!.isEmpty && !surnameTextField.text!.isEmpty){
            if(passwordTextField.text! == confirmPasswordTextField.text!){
                if(agreeChecker.isOn){
                    let user = User.init(
                            username : usernameTextField.text!,
                            email: emailTextField.text!,
                            name: nameTextField.text!,
                            surname: surnameTextField.text!,
                            profilePic: "",
                            password: passwordTextField.text!
                        )
                                
                    let request = Request.shared.postSignUp(user: user)
                    // Crear usuario
                    request.responseJSON { response in
                        print(response.response!)
                        if(response.response!.statusCode == 200){
                            // CREAR FUNCION ALERT
                            // No ha dado tiempo, futura mejora a implementar
                            let alert = UIAlertController(title: "User registered", message: "The user was registered succesfully. Press 'Continue' and Log in the app.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {action in self.navigationController?.popToRootViewController(animated: true)}))
                            self.present(alert, animated: true)
                            
                        }
                    }
                }else{
                    // Error aceptar terminos
                    errorTermsLabel.isHidden = false
                }
            }else {
                // Muchas alertas, demasiadas, cambiarlas por labels 
                let alert = UIAlertController(title: "Pass not match", message: "The password and confirm password text fields don't match", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                
            }
        } else {
                let alert = UIAlertController(title: "Fill all the fields", message: "Its necessary to fill all the text fields for continue with the register process.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
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
