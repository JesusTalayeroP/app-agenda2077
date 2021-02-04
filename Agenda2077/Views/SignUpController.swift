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
        // Do any additional setup after loading the view.
        
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        //Volver a la pantalla de LogIn
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
                    
                    request.responseJSON { response in
                        print(response.response!)
                        if(response.response!.statusCode == 200){
                            // CREAR FUNCION ALERT
                            // EN TITLE PONER UN STRING QUE DEPENDE DONDE CREE LA ALERTA ES UNO U OTRO
                            // EN MESSAGE HACER LO MISMO QUE EN TITLE
                            // TITLE DEL BOTON CONTINUE SIEMPRE
                            let alert = UIAlertController(title: "User registered", message: "The user was registered succesfully. Press 'Continue' and Log in the app.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {action in self.navigationController?.popToRootViewController(animated: true)}))
                            self.present(alert, animated: true)
                            
                        }
                    }
                }else{
                    errorTermsLabel.isHidden = false
                }
            }else {
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
