//
//  StoreRequest.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/11.
//

import UIKit
import Alamofire

class StoreRequest {
    func getShoppingMallRankingData(viewController: StoreViewController) {
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
    
    func getBrandRankingData(viewController: StoreViewController) {
        let url = "https://rczigzag.shop/app/stores/ranking-brand"
        
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: BrandEntity.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        viewController.didBrandAPISuccess(infoList: response.result)
                    } else {
                        viewController.didBrandAPIFailure(message: response.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }
    }
    
    func enrollBookMark(viewController: StoreViewController, index: Int) {
        
        if let userIdx = AuthData.userIdx, let jwt = AuthData.jwtToken {
            let url = "https://rczigzag.shop/app/users/\(userIdx)/favorite-stores"
            
            let params: Parameters = [
                "userIdx": "\(userIdx)",
                "storeIdx": "\(index)"
            ]
            
            let headers: HTTPHeaders = [
                "X-ACCESS-TOKEN": "\(jwt)"
            ]
            
            AF.request(url,
                       method: .post,
                       parameters: params,
                       encoding: JSONEncoding.default,
                       headers: headers)
                .responseDecodable(of: EditBookMarkEntity.self) { response in
                    switch response.result {
                    case .success(let response):
                        if response.isSuccess {
                            print(response)
                            viewController.enrollBookMarkAPISuccess()
                        } else {
                            viewController.enrollBookMarkAPIFailure()
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    
                }
        }
    }
    
    func dismissBookMark(viewController: StoreViewController, index: Int) {
        
        if let userIdx = AuthData.userIdx, let jwt = AuthData.jwtToken {
            let url = "https://rczigzag.shop/app/users/\(userIdx)/favorite-stores"
            
            let params: Parameters = [
                "userIdx": "\(userIdx)",
                "storeIdx": "\(index)"
            ]
            
            let headers: HTTPHeaders = [
                "X-ACCESS-TOKEN": "\(jwt)"
            ]
            
            AF.request(url,
                       method: .patch,
                       parameters: params,
                       encoding: JSONEncoding.default,
                       headers: headers)
                .responseDecodable(of: EditBookMarkEntity.self) { response in
                    switch response.result {
                    case .success(let response):
                        if response.isSuccess {
                            print(response)
                            viewController.dismissBookMarkAPISuccess()
                        } else {
                            viewController.dismissBookMarkAPIFailure()
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    
                }
        }
    }
    
    func getBookMarkData(viewController: BookMarkViewController) {
        
        if let userIdx = AuthData.userIdx, let jwt = AuthData.jwtToken {
            let url = "https://rczigzag.shop/app/users/\(userIdx)/favorite-stores"
            
            let params: Parameters = [
                "userIdx": "\(userIdx)",
            ]
            
            let headers: HTTPHeaders = [
                "X-ACCESS-TOKEN": "\(jwt)"
            ]
            
            AF.request(url,
                       method: .get,
                       parameters: params,
                       headers: headers)
                .responseDecodable(of: BookMarkEntity.self) { response in
                    switch response.result {
                    case .success(let response):
                        if response.isSuccess {
                            print(response)
                            viewController.didBookMarkAPISuccess(infoList: response.result)
                        } else {
                            viewController.didBookMarkAPIFailure(message: response.message)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    
                }
        }
    }
    
}
