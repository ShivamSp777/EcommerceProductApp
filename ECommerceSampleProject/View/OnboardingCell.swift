//
//  OnboardingCell.swift
//  ECommerceSampleProject
//
//  Created by Shivam_Pandey on 30/04/23.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
  static let identifier = "OnboardingCell"
  
  @IBOutlet weak var bgImage: UIImageView!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var desLabel: UILabel!
  
  func setup(_ data: OnboardingModel) {
    bgImage.image = data.bgImage
    title.text = data.title
    desLabel.text = data.description
  }
}
