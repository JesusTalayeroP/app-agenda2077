
import Foundation
import UIKit

class User : Encodable, Decodable{
    
     private var _username:String
     private var _email:String
     private var _name:String
     private var _surname:String
     private var _profilePic:String?
     private var _password:String?
    
    enum CodingKeys:String, CodingKey {
        case _name = "name"
        case _username = "username"
        case _profilePic = "profile_pic"
        case _email = "email"
        case _surname = "surname"
        case _password = "password"
    }
    
    init(username:String, email:String, name:String, surname:String, profilePic:String, password:String){
        
        self._username = username
        self._email = email
        self._name = name
        self._surname = surname
        self._profilePic = profilePic
        self._password = password
    }
    
    public var name: String {
        get {
            return self._name
        }
    }
}
