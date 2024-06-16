//
//  ProductDetailsVC.swift
//  ECommerceSampleProject
//
//  Created by Shivam_Pandey on 30/04/23.
//

import UIKit

class ProductDetailsVC: UIViewController {
  
  
  @IBOutlet weak var productImage: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var ratingButton: UIButton!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var productImages: String?
  var titleName = ""
  var details = ""
  var category = ""
  var rating = ""

    override func viewDidLoad() {
        super.viewDidLoad()

      productImage.kf.setImage(with: URL(string: productImages ?? ""), placeholder: nil, options: nil)
      titleLabel.text = titleName
      categoryLabel.text = category
      ratingButton.setTitle(rating, for: .normal)
      descriptionLabel.text = details
      // Do any additional setup after loading the view.
    
    }
  
  @IBAction func backAction(_ sender: UIButton) {    self.navigationController?.popViewController(animated: true)
  }
}
