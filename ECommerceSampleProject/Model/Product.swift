//
//  Product.swift
//  ECommerceSampleProject
//
//  Created by Shivam_Pandey on 30/04/23.
//

import Foundation

struct Product: Codable {
  let id: Int
  let title: String
  let price: Double
  let description: String
  let category: String
  let image: String
  let rating: Rating
  
}

struct Rating: Codable {
  let rate: Float
  let count: Int
}
