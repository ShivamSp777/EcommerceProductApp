//
//  AlertVC.swift
//  ECommerceSampleProject
//
//  Created by Shivam_Pandey on 24/05/23.
//

import UIKit

class AlertVC: UIViewController {
    
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func alertButton(_ sender: Any) {
   // showAlert()
  }
  
  
  func showAlert() {
    let alert = UIAlertController(title: "Alert", message: "First", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "ok", style: .default) { (action) in
      
    }
    alert.addAction(okAction)
    self.present(alert, animated: true) {
     // self.dismiss(animated: true) {
      
    }
  }
  
}

