 import UIKit

class ViewController: UIViewController {
    let databaseMangerInstance = DatabaseManger()
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
 
    @IBAction func forgotPasswordBTN(_ sender: Any) {
        if shouldPerformSegue(withIdentifier: "forgotPassSegue", sender: self){
            performSegue(withIdentifier: "forgotPassSegue", sender: self)
        }
    }
    @IBAction func newUserRegistraionBTN(_ sender: Any) {
         if shouldPerformSegue(withIdentifier: "registerationSegue", sender: self){
            performSegue(withIdentifier: "registerationSegue", sender: self)
        }
    }
    @IBAction func loginBTN(_ sender: Any) {
        
        if shouldPerformSegue(withIdentifier: "loginSegue", sender: self) {
            performSegue(withIdentifier: "loginSegue", sender: self)
        }
        else {
            let alertController = UIAlertController(title: "Message", message: databaseMangerInstance.faultMessage, preferredStyle: .alert)
           alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
             self.present(alertController, animated: true, completion: nil)
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSegue" {
            return databaseMangerInstance.loginUser(userEmail: emailTF.text!, userPassword: passwordTF.text!)
        }
        else if identifier == "registerationSegue"{
            return true
        }
        else if identifier == "forgotPassSegue" {
            return true
        }
        else {
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue"{
            _ = segue.destination as? AddChildViewController
        }
        else if segue.identifier == "registerationSegue" {
           _ =  segue.destination as? RegisterationViewController
        }
        else if segue.identifier == "forgotPassSegue" {
            _ = segue.destination as? ForgotPasswordViewController
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
        
