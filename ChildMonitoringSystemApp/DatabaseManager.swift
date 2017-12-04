//
//  DatabaseManager.swift
//  ChildMonitoringSystemApp
//
//  Created by Karthik Laddipeerla on 12/2/17.
//

import Foundation

class DatabaseManger{
    let APPLICATION_ID = "7832DD69-4383-402F-FF3D-5359A925AD00"
    let API_KEY = "59C8DB8E-0F3E-5FD3-FFA3-84E445E6E600"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    var faultMessage : String
    //
    init(){
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey:API_KEY)
        faultMessage = ""
    }
    func registerUser(userEmail : String , userPassword : String) -> Bool {
        // creating backendless user object
        var hasRegistered : Bool = false
        let user = BackendlessUser()
        user.setProperty("email", object: userEmail)
        user.password = userPassword as NSString

        Types.tryblock({() -> Void in
            self.backendless.userService.register(user)
            hasRegistered = true
        }, catchblock: {(exception)->Void in
            self.faultMessage = exception.debugDescription
            hasRegistered = false
        })
       return hasRegistered
    }
    func loginUser (userEmail : String , userPassword : String )  -> Bool {
        var isLoggedIn : Bool = false

        Types.tryblock({ () -> Void in
           
            self.backendless.userService.login(userEmail, password: userPassword)
            
            isLoggedIn = true
            
            
        },
                       catchblock: { (exception) -> Void in
                        self.faultMessage = exception.debugDescription
                        isLoggedIn = false
                        
        })
        
        
        return isLoggedIn
    }
    func forgotPassword(emailID : String) -> Bool {
        var hasSentMail : Bool = false

        Types.tryblock({()-> Void in
            self.backendless.userService.restorePassword(emailID)
            hasSentMail = true
        }, catchblock: {(exception)->Void in
            self.faultMessage = exception.debugDescription
            hasSentMail = false
        }
            
        )
        return hasSentMail
    }
}

