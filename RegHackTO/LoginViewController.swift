//
//  ViewController.swift
//  RegHackTO
//
//  Created by Yevhen Kim on 2016-11-25.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit
import LocalAuthentication
import QuartzCore

class LoginViewController: UIViewController {

    @IBOutlet weak var touchButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        let pulseAnimation = CABasicAnimation(keyPath: "opacity")
        pulseAnimation.duration = 2
        pulseAnimation.fromValue = 0
        pulseAnimation.toValue = 1
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = FLT_MAX
        self.touchButton.layer.add(pulseAnimation, forKey: nil)
    }
    
    @IBAction func touchButtonPressed(_ sender: Any) {
        authenticateUser()
    }

    func authenticateUser() {
        //get the Local authentication context
        let authenticationContext: LAContext = LAContext()
        
        //declare a NSError var
        var error: NSError?
        
        // 2. Check if the device has a fingerprint sensor
        // If not, show the user an alert view and bail out!
        guard authenticationContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
            
            showAlertViewIfNoBiometricSensorHasBeenDetected()
            return
        }
 
        // 3. Check the fingerprint
        authenticationContext.evaluatePolicy(
            LAPolicy.deviceOwnerAuthentication,
            localizedReason: "Only awesome people are allowed",
            reply: { [unowned self] (success, error) -> Void in
                
                if( success ) {
                    
                    // Fingerprint recognized
                    // Go to view controller
                    self.navigateToAuthenticatedViewController()
                    
                }else {
                    
                    // Check if there is an error
                    if let error = error {
                        
                        let message = self.errorMessageForLAErrorCode(errorCode: error._code)
                        self.showAlertWithTitle(title: "Error", message: message)
                    }
                }
        })
    }
    
    func showAlertViewIfNoBiometricSensorHasBeenDetected(){
        
        showAlertWithTitle(title: "Error", message: "This device does not have a TouchID sensor.")
        
    }
    
    func showAlertWithTitle( title:String, message:String ) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    func navigateToAuthenticatedViewController(){
        
        if let validationInVC = storyboard?.instantiateViewController(withIdentifier: "ValidationViewController") {
            
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(validationInVC, animated: true)
            }
        }
    }
    
    
    
    func errorMessageForLAErrorCode( errorCode:Int ) -> String{
        
        var message = ""
        
        switch errorCode {
            
        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"
            
        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
            
        case LAError.invalidContext.rawValue:
            message = "The context is invalid"
            
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
            
        case LAError.touchIDLockout.rawValue:
            message = "Too many failed attempts."
            
        case LAError.touchIDNotAvailable.rawValue:
            message = "TouchID is not available on the device"
            
        case LAError.userCancel.rawValue:
            message = "The user did cancel"
            
        case LAError.userFallback.rawValue:
            message = "The user chose to use the fallback"
            
        default:
            message = "Did not find error code on LAError object"
            
        }
        
        return message        
    }
}

