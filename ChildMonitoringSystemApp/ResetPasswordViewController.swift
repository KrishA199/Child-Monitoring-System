//
//  ResetPasswordViewController.swift
//  ChildMonitoringSystemApp
//
//  Created by student on 2/8/18.
//

import UIKit

class ResetPasswordViewController: UIViewController {
let databaseManagerInstance = DatabaseManger()
    @IBOutlet weak var emailIDTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetPasswordBTN(_ sender: UIButton) {
        if databaseManagerInstance.forgotPassword(emailID: emailIDTF.text!){
            
        }
        
        else {
            let alertController = UIAlertController(title: "Message", message: databaseManagerInstance.faultMessage, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
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
