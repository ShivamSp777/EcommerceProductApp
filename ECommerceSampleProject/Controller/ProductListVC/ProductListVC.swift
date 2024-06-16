//
//  ProductListVC.swift
//  ECommerceSampleProject
//
//  Created by Shivam_Pandey on 30/04/23.
//

import UIKit

class ProductListVC: UIViewController {
  
//  MARK: - IBOutlets Property
  @IBOutlet weak var collectionView: UICollectionView!
  
//  MARK: - Instance Property
  var product: [Product] = []
  
//  MARK: - View Controller Life Cycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
          registerXibCell()
          getProductData()
         
        // Do any additional setup after loading the view.
    }
//  MARK: - Register XIb Cell
  
  func registerXibCell() {
    self.collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
  }
  
//  MARK: - Get Product Data API
  func getProductData() {
    APICall.getApiData(url:  URL(string: "https://fakestoreapi.com/products")!, result: [Product].self) { result in
      
      DispatchQueue.main.async {
      self.product = result
      print("result --", result)
      self.collectionView.reloadData()
      }
    }
  }

}

// MARK: - Collection View Datasource Method

extension ProductListVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    product.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
    cell.setUpUI(data: product[indexPath.row])
    return cell
  }

}

// MARK: - Collection View Delegate method

extension ProductListVC: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let seletedIndex = product[indexPath.row]
    
    let vc = storyboard?.instantiateViewController(identifier: "ProductDetailsVC") as! ProductDetailsVC
    vc.titleName = seletedIndex.title
    vc.details = seletedIndex.description
    vc.productImages = seletedIndex.image
    vc.category = seletedIndex.category
    vc.rating = "\(seletedIndex.rating.rate)"
    self.navigationController?.pushViewController(vc, animated: true)
  }
}

extension ProductListVC: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size = (collectionView.frame.size.width - 20) / 2
    return CGSize(width: size, height: size)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    4
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    4
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
  }
}




