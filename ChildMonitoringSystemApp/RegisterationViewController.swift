//
//  RegisterationViewController.swift
//  ChildMonitoringSystemApp
//
//  Created by Mucherla,Veera Kishon Kumar on 12/2/17.
//

import UIKit

class RegisterationViewController: UIViewController {
    let databaseManagerInstance : DatabaseManger = DatabaseManger()
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var reEnterPasswordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func registerBTN(_ sender: Any) {
        if shouldPerformSegue(withIdentifier: "registerSegue", sender: self){
            performSegue(withIdentifier: "registerSegue", sender: self)
        }
        else {
            let alertController = UIAlertController(title: "Message", message: "Please check the password or email that you have entered", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "registerSegue" && passwordTF.text! == reEnterPasswordTF.text!{
        
        return databaseManagerInstance.registerUser(userEmail: emailTF.text!, userPassword: passwordTF.text!)
        }
        else {
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination as? RegistrationThankYouViewController
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
