//
//  ProfileViewController.swift
//  ByeBio
//
//  Created by 김민서 on 2017. 7. 25..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit
import MobileCoreServices

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var btnPlus: UIButton!
    
    let imagePikcer: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL: URL!
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPlus.layer.borderWidth = 0
        btnPlus.layer.masksToBounds = false
        btnPlus.layer.cornerRadius = btnPlus.frame.height/2
        btnPlus.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPlus(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePikcer.delegate = self
            imagePikcer.sourceType = .photoLibrary
            imagePikcer.mediaTypes = [kUTTypeImage as String]
            imagePikcer.allowsEditing = true
            
            present(imagePikcer, animated: true, completion: nil)
        } else {
            myAlert("Photo album inaccessable", message: "Applcation cannot access the photo album.")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func myAlert(_ title : String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
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
