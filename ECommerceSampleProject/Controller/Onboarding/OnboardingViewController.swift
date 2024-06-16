//
//  OnboardingViewController.swift
//  ECommerceSampleProject
//
//  Created by Shivam_Pandey on 30/04/23.
//

import UIKit

class OnboardingViewController: UIViewController {
  
//MARK: - IBoutlets property
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var nextbutton: UIButton!
  @IBOutlet weak var onboardCollectionView: UICollectionView!
  
  //MARK: - Computed property
  
  var currentPage = 0 {
    didSet {
      pageControl.currentPage = currentPage
      if currentPage == image.count - 1 {
        nextbutton.setTitle("Get Started", for: .normal)
      } else {
        nextbutton.setTitle("Next", for: .normal)
      }
    }
  }
  
  var image: [OnboardingModel] = []
  
  //MARK: - viewDidLoad Life Cycle methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.isNavigationBarHidden = true
    
    image = [
      OnboardingModel(bgImage: #imageLiteral(resourceName: "First"), title: "Buy a product using single click ", description: "Find awesome product here & buy you choice"),
      OnboardingModel(bgImage: #imageLiteral(resourceName: "second"), title: "This is Awesome background.", description: "This background looks very nice and beautifull"),
      OnboardingModel(bgImage: #imageLiteral(resourceName: "third"), title: "Looking Great", description: "Nature is god gifted things & god create beautifull things.")
      
      
    ]
    
  }
  //MARK: - Next Button Action
  @IBAction func nextAction(_ sender: UIButton) {
    
    if currentPage == image.count - 1 {
      print("go to next page")
      let productVc = storyboard?.instantiateViewController(identifier: "ProductListVC") as!
        ProductListVC
      self.navigationController?.pushViewController(productVc, animated: true)
      
    } else {
      currentPage += 1
      let indexPath = IndexPath(item: currentPage, section: 0)
      onboardCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
  }
}

//MARK: - Extension UICollectionViewDelegate & DataSource

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    image.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = onboardCollectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as! OnboardingCell
    
    cell.setup(image[indexPath.row])
    
    return cell
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let width = scrollView.frame.width
    currentPage = Int(scrollView.contentOffset.x / width)
    
  }
}

//MARK: - OnboardingViewController

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
}

