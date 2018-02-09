//
//  HomeViewController.swift
//  ChildMonitoringSystemApp
//
//  Created by student on 2/8/18.
//

import UIKit

class HomeViewController: UIViewController {
    static let databaseManagerInstance = DatabaseManger()
    @IBOutlet weak var emailOrUserNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginBTN(_ sender: UIButton) {
         performSegue(withIdentifier: "loginSegue", sender: self)
//        if HomeViewController.databaseManagerInstance.loginUser(userEmail: emailOrUserNameTF.text!, userPassword: passwordTF.text!) {
//            performSegue(withIdentifier: "loginSegue", sender: self)
//
//        }
//        else {
//            print("Hello")
//            let alertController = UIAlertController(title: "Message", message: HomeViewController.databaseManagerInstance.faultMessage, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
//            self.present(alertController, animated: true, completion: nil)
//        }
    }
    @IBAction func forgotPasswordBTN(_ sender: UIButton) {
        performSegue(withIdentifier: "resetSegue", sender: self)
    }
    @IBAction func registrationBTN(_ sender: UIButton) {
    performSegue(withIdentifier: "registerSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "loginSegue"{
            _ = segue.destination as? AddChildViewController
            
        }
        else if segue.identifier! == "registerSegue" {
            _ = segue.destination as? RegisterViewController
        }
        else {
            _ = segue.destination as? ResetPasswordViewController
        }
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
