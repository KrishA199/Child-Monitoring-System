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
    
    //
    init(){
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey:API_KEY)
        
    }
    func registerUser(userEmail : String , userPassword : String) -> Bool {
        // creating backendless user object
        var hasRegistered : Bool = false
        let user = BackendlessUser()
        user.setProperty("email", object: userEmail)
        user.password = userPassword as NSString
//        self.backendless.userService.register(user,
//                                              response: {
//                                                (registeredUser : BackendlessUser?) -> Void in
//                                                print("User registered \(String(describing: registeredUser?.value(forKey: "email")))")
//                                                hasRegistered = true
//
//        },
//                                              error: {
//                                                (fault : Fault?) -> Void in
//                                                print("Server reported an error: \(String(describing: fault?.description))")
//                                                hasRegistered = false
//        })
        Types.tryblock({() -> Void in
            self.backendless.userService.register(user)
            hasRegistered = true
        }, catchblock: {(exception)->Void in
            print(exception)
            hasRegistered = false
        })
       return hasRegistered
    }
    func loginUser (userEmail : String , userPassword : String )  -> Bool {
        var isLoggedIn : Bool = false
//        self.backendless.userService.login(userEmail,
//                                           password: userPassword,
//                                           response: {
//                                            (loggedUser : BackendlessUser?) -> Void in
//                                            isLoggedIn = true
//                                            print("Logged In Succesfull")
//                                            isLoggedIn = true
//        },
//                                           error: {
//                                            (fault : Fault?) -> Void in
//                                            isLoggedIn = false
//        })
        Types.tryblock({ () -> Void in
           
            self.backendless.userService.login(userEmail, password: userPassword)
            
            isLoggedIn = true
            
            
        },
                       catchblock: { (exception) -> Void in
                        isLoggedIn = false
                        
        })
        
        
        return isLoggedIn
    }
    func forgotPassword(emailID : String) -> Bool {
        var hasSentMail : Bool = false
//        self.backendless.userService.restorePassword(emailID,
//                                                     response: {
//                                                        (result : Any) -> Void in
//                                                        print("Please check your email inbox to reset your password")
//                                                    hasSentMail = true
//        },
//                                                     error: {
//                                                        (fault : Fault?) -> Void in
//                                                        print("Server reported an error: \(String(describing: fault?.description))")
//                                                        hasSentMail = false
//        })
        Types.tryblock({()-> Void in
            self.backendless.userService.restorePassword(emailID)
            hasSentMail = true
        }, catchblock: {(exception)->Void in
            hasSentMail = false
        }
            
        )
        return hasSentMail
    }
}

