//
//  HomeRequest.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/07.
//

import Foundation
import UIKit
import Alamofire

class HomeRequest {
    func getHomeBasicData(viewController: HomeViewController) {
        let url = "https://rczigzag.shop/app/products/home"
        
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: HomeBasicEntity.self) { response in
            
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        viewController.didHomeBaseAPISuccess(infoList: response.result)
                    } else {
                        viewController.didHomeBaseAPIFailure(message: response.message)
                    }
//                    print(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }

        }
    }
    
    func getRecommendData(viewController: HomeViewController) {
        let url = "https://rczigzag.shop/app/products/recommended-products"
        
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: RecommendEntity.self) { response in
            
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        viewController.didRecommendAPISuccess(infoList: response.result)
                    } else {
                        viewController.didRecommendAPIFailure(message: response.message)
                    }
                    print(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }

        }
    }
}
