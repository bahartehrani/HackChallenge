//
//  NetworkManager.swift
//  Spots
//
//  Created by Productivity on 12/5/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    private static let studySpotsEndpoint = "http://35.196.120.45/"
    private static var studySpotsImages : [String]!
    
    static func getBackendSpots(completion: @escaping ([readSpot]) -> Void) {
        print("test")
        Alamofire.request(studySpotsEndpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let readData):
                let jsonDecoder = JSONDecoder()
                print("test2")
                if let spotsData = try? jsonDecoder.decode(SpotResponse.self, from: readData) {
                    let suc = spotsData.success
                    print("test3")
                    let spotsRead = spotsData.data
                    completion(spotsRead)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    static func fetchSpotImage(imageURL: String, completion: @escaping (UIImage) -> Void) {
        
        Alamofire.request(imageURL, method: .get).validate().responseData { response in
            switch response.result {
                
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(image)
                } else {
                    print("Invalid image data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    
    }
}
