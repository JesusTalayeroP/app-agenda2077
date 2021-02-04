

import UIKit

class ProfileController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var oldPasswordTextField: UITextField!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ChangePasswordButton(_ sender: Any) {
        let parameters = [
            "new_password" : newPasswordTextField.text!
        ]
        
        let request = Request.shared.postLogIn(parameters: parameters)
        
        request.responseJSON { response in
            print(response.response!)
            if(response.response!.statusCode == 200){
                
                let alert = UIAlertController(title: "Password Changed" , message: "The new password was changed. Use it for the nex Log In", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }else {
                
                let alert = UIAlertController(title: "Password incorrect" , message: "The password introduced was incorrect, change it and try again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                
            }
        }
    }
    
    @IBAction func LogOutButton(_ sender: Any) {
    }
    
    @IBAction func DeletteAccounButton(_ sender: Any) {
    }
    
}
