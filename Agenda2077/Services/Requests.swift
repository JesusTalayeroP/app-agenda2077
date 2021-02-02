//
//  Services.swift
//  Agenda2077
//
//  Created by user176680 on 2/2/21.
//  Copyright © 2021 cev. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    private init() {}
    
    func getUsers() -> [User?]{
        var users: [User]? = nil
        
        let url = URL(string: "https://superapi.netlify.app/api/users")
        
        URLSession.shared.dataTask(with: url!) {
        data, response, error in
            if error == nil {
            // Usar data
                users = try! JSONDecoder().decode([User].self, from: data!)
                
                for user in users! {
                    print(user.name)
                }
                
            } else {
                print(error!)
            }
        }.resume()
        
        return users!
        
    }
}
