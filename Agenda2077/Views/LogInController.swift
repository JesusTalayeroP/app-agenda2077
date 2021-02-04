//
//  ViewController.swift
//  Agenda2077
//
//  Created by alumnos on 28/01/2021.
//  Copyright © 2021 cev. All rights reserved.
//

import UIKit

class LogInController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LogInController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }

    @IBAction func LogInButton(_ sender: Any) {
        
        if(!emailTextField.text!.isEmpty && !passwordTextField.text!.isEmpty){
            
            let parameters = [
                "username" : emailTextField.text!,
                "password" : passwordTextField.text!
            ]
            
            let request = Request.shared.postLogIn(parameters: parameters)
            
            request.responseJSON { response in
                
                if(response.response!.statusCode == 200 && response.value! as! String != "Wrong user or password" && response.value! as! String != "No user"){
                    
                    let body = response.value as? String
                    let splitBody = body?.split(separator: " ")
                    let apiToken = splitBody![1]
                    
                    UserDefaults.standard.set(apiToken, forKey: "apiToken")
                    
                    self.performSegue(withIdentifier: "mainView", sender: sender)
                    // Ocultar la barra de navegacion superior para que no se pueda volver a loguear una vez está el usuario en la agenda
                    self.navigationController?.setNavigationBarHidden(true, animated: true)
                    
                }else {
                    let title = "Wrong email or password"
                    let message = "The email or passwor introduced is incorrect"
                    
                    let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                    
                }
            }
        }
        

    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
   
    func Alert(title: String, message: String){
            
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

    }
    
    
}

