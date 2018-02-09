//
//  RegisterViewController.swift
//  ChildMonitoringSystemApp
//
//  Created by student on 2/8/18.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailIDTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var rePasswordTF: UITextField!
    let databaseManagerInstance = DatabaseManger()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func createAccountBTN(_ sender: UIButton) {
        if passwordTF.text! == rePasswordTF.text!{
        if databaseManagerInstance.registerUser(userEmail: emailIDTF.text!, userPassword: passwordTF.text!){
            let alertController = UIAlertController(title: "Message", message: "Sucessfully created account.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
        }
        }
    else {
    let alertController = UIAlertController(title: "Message", message: "Invalid Input", preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
    self.present(alertController, animated: true, completion: nil)
        }
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
