//
//  AgendaController.swift
//  Agenda2077
//
//  Created by user176680 on 2/1/21.
//  Copyright © 2021 cev. All rights reserved.
//

import UIKit

class AgendaController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
        
    func getusers() -> [User?]{
        var users: [User]? = nil
        
        let url = URL(string: "https://superapi.netlify.app/api/users")
        
        URLSession.shared.dataTask(with: url!) {
        data, response, error in
            if error == nil {
            // Usar data
                users = try! JSONDecoder().decode([User].self, from: data!)
                
                for user in users! {
                    print(user.user, user.pass)
                }
                
            } else {
                print(error!)
            }
        }.resume()
        
        return users!
        
    }
        
        
    
    



}
