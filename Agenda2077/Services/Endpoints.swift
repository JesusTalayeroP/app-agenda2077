//
//  Endpoints.swift
//  Agenda2077
//
//  Created by alumnos on 03/02/2021.
//  Copyright © 2021 cev. All rights reserved.
//

import Foundation

class Endpoints {
    
    private init() {}
    
    static let shared = Endpoints()
    
    let baseURL = "https://79.159.179.214/api/users"
    
    //User´s Petitions
   
        let getUsers:String = "/all"
        let login:String = "/login"
        let rgister:String = "/register"
    
}
