

import UIKit
import Foundation
import Alamofire

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
        
        getProfileInfoRequest()
        
    }
    
    @IBAction func ChangePasswordButton(_ sender: Any) {
        
        if(!oldPasswordTextField.text!.isEmpty && !newPasswordTextField.text!.isEmpty && !confirmPasswordTextField.text!.isEmpty){
            if(newPasswordTextField.text! == confirmPasswordTextField.text){
        
                let parameters = [
                    "password": oldPasswordTextField.text!,
                    "new_password": newPasswordTextField.text!,
                    "api_token": apiToken
                ]
                
                let request = Request.shared.postChangePassword(parameters: parameters)
                
                request.responseJSON { response in
                    print(response.response!)
                    print(parameters)
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
        let alert = UIAlertController(title: "Are you sure?", message: "If you log Out you will have to Log In again for use the application. Do you want to Log Out?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler:{ action in self.navigationController?.popToRootViewController(animated: true)}))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func DeletteAccounButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "WARNING", message: "You are deletting your account. It's a irreversible action. If you continue you will lost your account and all your saved data. Do you want to follow with the process?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler:{ action in self.deleteAccountRequest()}))
        
        self.present(alert, animated: true)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func getProfileInfoRequest(){
        let parameters = [
            "api_token": apiToken
        ]
        
        let request = Request.shared.postProfileInfo(parameters: parameters)
        
        request.responseJSON{ response in
            guard let data = response.data
                else {return}
            
            do{
                self.user = try
                    JSONDecoder().decode(User.self, from: data)
                
                /*let attributedEmail = NSMutableAttributedString(string: "Email; " + self.user!.email)
                attributedEmail.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location: 5, length: 5))
                attributedEmail.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: NSRange(location: attributedEmail.length, length: attributedEmail.length - 5))
                self.emailLabel.attributedText = attributedEmail*/
                
                self.emailLabel.text = self.user!.email
                self.nameLabel.text = self.user!.name
                self.usernameLabel.text = self.user!.username
                self.surnameLabel.text = self.user!.surname
                
            }catch{
                print("error")
            }
        }
    
    }
    
    func deleteAccountRequest(){
        let parameters = [
            "api_token": apiToken
        ]
        
        let request = Request.shared.postDeleteUser(parameters: parameters)
        
        request.responseJSON{ response in
            
            if(response.response!.statusCode == 200){
                UserDefaults.standard.removeObject(forKey: "apiToken")
                
                let alert = UIAlertController(title: "User Deleted", message: "The user was deleted successfully. Log In with other account or create a new one", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in self.navigationController?.popToRootViewController(animated: true)}))
                
                self.present(alert, animated: true)
            }
        }
        
        
    }
}
