//
//  ValidationViewController.swift
//  RegHackTO
//
//  Created by Yevhen Kim on 2016-11-25.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import Foundation
import UIKit

class ValidationViewController: UIViewController {
    
    @IBOutlet weak var driverLicenseImageView: UIImageView!
    @IBOutlet weak var PassportImageView: UIImageView!
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var reputation: UITextField!
    @IBOutlet weak var sinNumber: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if let InstitutionVC = self.storyboard?.instantiateViewController(withIdentifier: "InstitutionVC") {
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(InstitutionVC, animated: true)
            }
        }
    }
}
