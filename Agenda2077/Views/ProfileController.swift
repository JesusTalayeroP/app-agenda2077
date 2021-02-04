

import UIKit
import Foundation

class ProfileController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var oldPasswordTextField: UITextField!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    let apiToken = UserDefaults.standard.string(forKey: "apiToken")!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LogInController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        getProfileInfo()
        
    }
    
    @IBAction func ChangePasswordButton(_ sender: Any) {
        
        if(!oldPasswordTextField.text!.isEmpty && !newPasswordTextField.text!.isEmpty && !confirmPasswordTextField.text!.isEmpty){
            if(newPasswordTextField.text! == confirmPasswordTextField.text){
        
                let parameters = [
                    "password" : newPasswordTextField.text!,
                    "api_token": apiToken
                ]
                
                let request = Request.shared.postLogIn(parameters: parameters)
                
                request.responseJSON { response in
                    if(response.response!.statusCode == 200){
                        
                        let alert = UIAlertController(title: "Password Changed" , message: "The new password was changed. Use it for the nex Log In", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
                        self.present(alert, animated: true)
                    }else {
                        
                        let alert = UIAlertController(title: "Old Password incorrect" , message: "The password introduced was incorrect, change it and try again", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
                        self.present(alert, animated: true)
                    }
                }
            } else{
                let alert = UIAlertController(title: "Pass not match", message: "The new password and confirm new password text fields don't match", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }else {
            let alert = UIAlertController(title: "Fill all the fields", message: "Its necessary to fill all the text fields for continue with the change password process.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func LogOutButton(_ sender: Any) {
    }
    
    @IBAction func DeletteAccounButton(_ sender: Any) {
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func getProfileInfo(){
        var parameters = [
            "api_token": apiToken
        ]
        
        var request = Request.shared.postProfileInfo(parameters: parameters)
        
        request.responseJSON{ response in
            guard let data = response.data
                else {return}
            
            do{
                self.user = try
                    JSONDecoder().decode(User.self, from: data)
                
                /*self.emailLabel.text = self.emailLabel.text! + self.user!.email
                self.namelLabel.text = self.nameLabel.text! + self.user!.name
                self.usernameLabel.text = self.usernameLabel.text! + self.user!.username
                self.surnameLabel.text = self.surnameLabel.text! + self.user!.surname*/
                
            }catch{
                print(data)
            }
        }
    
    }
}
