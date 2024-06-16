//
//  ProductCollectionViewCell.swift
//  ECommerceSampleProject
//
//  Created by Shivam_Pandey on 30/04/23.
//

import UIKit
import Kingfisher
class ProductCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var productImage: UIImageView!
  @IBOutlet weak var ratingButton: UIButton!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  func setUpUI(data: Product) {
    titleLabel.text = data.title
    ratingButton.setTitle("\(data.rating.rate)", for: .normal)
    productImage.kf.setImage(with: URL(string: data.image), placeholder: nil, options: nil)
  }
}
