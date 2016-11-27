//
//  ValidationViewController.swift
//  RegHackTO
//
//  Created by Yevhen Kim on 2016-11-25.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import Foundation
import UIKit

class ValidationViewController: UIViewController, UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var driverLicenseImageView: UIImageView!
    @IBOutlet weak var PassportImageView: UIImageView!
    
    @IBOutlet weak var check2: UIImageView!
    @IBOutlet weak var check1: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var reputation: UITextField?
    @IBOutlet weak var sinNumber: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var creditReportLink: UITextField!
    @IBOutlet weak var financialCircumstancesLink: UITextField?
    
    let stylesheet: Styles = Styles.sharedInstance
    
    var imageDL: UIImage?
    var imagePass: UIImage?
    
    var isDLTapped = false
    var isPassTapped = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        toggleNextButton()
        setupKeyboardNotification()
        //takeDLImage()
        setupDL()
        takePassImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func takeDLImage() {
        let tapGestureRocognizer = UITapGestureRecognizer(target: self, action: #selector(imageDLTapped))
        driverLicenseImageView.isUserInteractionEnabled = true
        driverLicenseImageView.addGestureRecognizer(tapGestureRocognizer)
    }
    
    func takePassImage() {
        let tapGestureRocognizer = UITapGestureRecognizer(target: self, action: #selector(imagePassTapped))
        PassportImageView.isUserInteractionEnabled = true
        PassportImageView.addGestureRecognizer(tapGestureRocognizer)
    }
    
    func imageDLTapped() {
        self.isDLTapped = true
        tap()
    }
    
    func imagePassTapped() {
        self.isPassTapped = true
        tap()
    }
    
    func tap() {
        let imagePicker:UIImagePickerController =  UIImagePickerController.init()
        imagePicker.sourceType = .camera
        imagePicker.cameraDevice = .front
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: {})
    }

    
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // MARK: keyboard actions
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    // change next button state
    func toggleNextButton() {
        let styleSheet = Styles.sharedInstance
        if ((firstName.text?.isEmpty)! || (lastName.text?.isEmpty)! || (dob.text?.isEmpty)! || (addressField.text?.isEmpty)! || (creditReportLink.text?.isEmpty)! || (sinNumber.text?.isEmpty)!) {
            saveButton.isEnabled = false
            saveButton.backgroundColor = styleSheet.lightgrayColor
        }
        else {
            saveButton.isEnabled = true
            saveButton.setTitleColor(styleSheet.whiteColor, for: .normal)
            saveButton.backgroundColor = styleSheet.backgroundColor
            saveButton.layer.cornerRadius = styleSheet.buttonCornerRadius
        }
    }

    // MARK pragma: Image picker Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if (self.isDLTapped) {
//            self.driverLicenseImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//            self.driverLicenseImageView.contentMode = .scaleToFill
//            self.driverLicenseImageView.layer.masksToBounds = true
//            self.driverLicenseImageView.layer.cornerRadius = stylesheet.buttonCornerRadius
//            //FIXME: add completion handler to safe image
//            self.dismiss(animated: true)
//            self.check1.alpha = 1
//            self.isDLTapped = false
//        }
        if (self.isPassTapped) {
            self.PassportImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            self.PassportImageView.contentMode = .scaleToFill
            self.PassportImageView.layer.masksToBounds = true
            self.PassportImageView.layer.cornerRadius = stylesheet.buttonCornerRadius
            //FIXME: add completion handler to safe image
            self.dismiss(animated: true)
            self.check2.alpha = 1
            self.isPassTapped = false
        }
    }
    
    func setupDL() {
        self.driverLicenseImageView.image = UIImage(named: "default.jpg")
        self.driverLicenseImageView.contentMode = .scaleToFill
        self.driverLicenseImageView.layer.masksToBounds = true
        self.driverLicenseImageView.layer.cornerRadius = stylesheet.buttonCornerRadius
        self.check1.alpha = 1
    }

    // MARK pragma: Text Field Delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        toggleNextButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if let InstitutionVC = self.storyboard?.instantiateViewController(withIdentifier: "InstitutionVC") {
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(InstitutionVC, animated: true)
            }
        }
    }
}
