//
//  MainViewController.swift
//  ByeBio
//
//  Created by 김민서 on 2017. 7. 24..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit
import CoreMotion

class MainViewController: UIViewController {

    @IBOutlet weak var lblCircle:UILabel!
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblCircle.layer.borderWidth = 1
        lblCircle.layer.masksToBounds = false
        lblCircle.layer.borderColor = UIColor.black.cgColor
        lblCircle.layer.cornerRadius = lblCircle.frame.height/2
        lblCircle.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        motionManager.gyroUpdateInterval = 0.2
        
        motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data
            {
                print (myData.rotationRate)
            }
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
