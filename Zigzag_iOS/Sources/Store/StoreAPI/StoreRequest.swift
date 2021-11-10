//
//  StoreRequest.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/11.
//

import UIKit
import Alamofire

class StoreRequest {
    func getShoppingMallData(viewController: StoreViewController) {
        let url = "https://rczigzag.shop/app/stores/ranking-shoppingmall"
        
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: StoreEntity.self) { response in
                print(response)
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        viewController.didShoppingMallAPISuccess(infoList: response.result)
                    } else {
                        viewController.didShoppingMallAPIFailure(message: response.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }
    }
}
