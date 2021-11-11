//
//  SignUpRequest.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/03.
//

import Alamofire
import UIKit

class AuthRequest {
    func sendSignUpData(email: String, password: String, viewController: SetEmailPasswordViewController) {
        let url = "https://rczigzag.shop/app/users"
        let params: Parameters = [
            "email": "\(email)",
            "password": "\(password)"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: nil)
            .responseDecodable(of: AuthEntity.self) { response in
            
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        AuthData.jwtToken = response.result?.jwt
                        AuthData.userIdx = response.result?.userIdx
                        viewController.didSignUpSuccess()
                    } else {
                        viewController.didSignUpFailure(message: response.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }

        }
    }
    
    func sendLoginData(email: String, password: String, viewController: EmailLoginViewController) {
        let url = "https://rczigzag.shop/app/users/logIn"
        let params: Parameters = [
            "email": "\(email)",
            "password": "\(password)"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: nil)
            .responseDecodable(of: AuthEntity.self) { response in
            
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        AuthData.jwtToken = response.result?.jwt
                        AuthData.userIdx = response.result?.userIdx
                        viewController.didLoginSuccess()
                    } else {
                        viewController.didLoginFailure(message: response.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }

        }
    }
    
    func withDrawData(viewController: SettingUserInfoViewController) {
        if let userIdx = AuthData.userIdx, let jwt = AuthData.jwtToken {
            let url = "https://rczigzag.shop/app/users/\(userIdx)/delection"
            let params: Parameters = [
                "userIdx": "\(userIdx)"
            ]
            
            let headers: HTTPHeaders = [
                "X-ACCESS-TOKEN": "\(jwt)"
            ]
            
            AF.request(url,
                       method: .patch,
                       parameters: params,
                       encoding: JSONEncoding.default,
                       headers: headers)
                .responseDecodable(of: WithDrawEntity.self) { response in
                
                    switch response.result {
                    case .success(let response):
                        if response.isSuccess {
                            viewController.successWithDraw()
                        } else {
                            viewController.faliureWithDraw()
                        }
                        print(response)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }

            }
        }
    }
}
