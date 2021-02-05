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
        
        UserDefaults.standard.removeObject(forKey: "apiToken")
    }
    
    //Cuando vuelve de un log out o delete user volver a mostrar la barra de navegacion superior
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func LogInButton(_ sender: Any) {
        //Comprobaciones
        if(!emailTextField.text!.isEmpty && !passwordTextField.text!.isEmpty){
            
            let parameters = [
                "username" : emailTextField.text!,
                "password" : passwordTextField.text!
            ]
            
            let request = Request.shared.postLogIn(parameters: parameters)
            // Peticion
            request.responseJSON { response in
                // Validaciones
                if(response.response!.statusCode == 200 && response.value! as! String != "Wrong user or password" && response.value! as! String != "No user"){
                    
                    let body = response.value as? String
                    let splitBody = body?.split(separator: " ")
                    let apiToken = splitBody![1]
                    // Guardar token
                    UserDefaults.standard.set(apiToken, forKey: "apiToken")
                    
                    self.performSegue(withIdentifier: "mainView", sender: sender)
                    // Ocultar la barra de navegacion superior para que no se pueda volver a loguear una vez está el usuario en la agenda
                    self.navigationController?.setNavigationBarHidden(true, animated: true)
                    
                }else {
                    let title = "Wrong user or password"
                    let message = "The user or password introduced is incorrect"
                    //Alerta de ussuario o contraseña incorrecta
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
    
   // Creacion de alerta (NO FUNCIONAAAA)
    /*func Alert(title: String, message: String){
            
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

    }*/
    
    
}

