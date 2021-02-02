//
//  ViewController.swift
//  Agenda2077
//
//  Created by alumnos on 28/01/2021.
//  Copyright © 2021 cev. All rights reserved.
//

import UIKit

class LogInController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func LogInButton(_ sender: Any) {
        // Ocultar la barra de navegacion superior para que no se pueda volver a loguear una vez está el usuario en la agenda
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
}

