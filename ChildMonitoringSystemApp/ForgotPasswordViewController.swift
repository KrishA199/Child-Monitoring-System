//
//  ForgotPasswordViewController.swift
//  ChildMonitoringSystemApp
//
//  Created by Koushik and Unnathi on 12/2/17.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailIDTF: UITextField!
    let databaseManagerInstance = DatabaseManger()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func homePageBTN(_ sender: Any) {
        if shouldPerformSegue(withIdentifier: "loginSegue", sender: self) {
            performSegue(withIdentifier: "loginSegue", sender: self)
        }
    }
    @IBAction func resetPasswordBTN(_ sender: Any) {
        if shouldPerformSegue(withIdentifier: "verificationMessageSegue", sender: self){
        performSegue(withIdentifier: "verificationMessageSegue", sender: self)
        }
        else {
            let alertController = UIAlertController(title: "Message", message: databaseManagerInstance.faultMessage, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "verificationMessageSegue" {
            return databaseManagerInstance.forgotPassword(emailID: emailIDTF.text!)
            
        }
        else if identifier == "loginSegue" {
            
            return true
        }
        else {
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verificationMessageSegue"{
        _ = segue.destination as? VerificationMessageViewController
        }
        else if segue.identifier == "loginSegue"{
            print("Over here")
            _ = segue.destination as? ViewController
        }
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
