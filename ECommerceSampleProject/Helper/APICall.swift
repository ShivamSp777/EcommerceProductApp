//
//  APICall.swift
//  ECommerceSampleProject
//
//  Created by Shivam_Pandey on 30/04/23.
//

import Foundation

class APICall {
  
  static func getApiData<T: Codable>(url: URL, result: T.Type, completionHandler: @escaping(_ result: T) -> Void) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      do {
        let result = try JSONDecoder().decode(T.self, from: data!)
        completionHandler(result)
      } catch {
        print("Something Went wrong")
      }
    }.resume()
  }
}

