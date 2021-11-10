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
                        viewController.didSignUpSuccess()
                    } else {
                        viewController.didSignUpFailure(message: response.message)
                    }
                    print(response)
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
                        viewController.didLoginSuccess()
                    } else {
                        viewController.didLoginFailure(message: response.message)
                    }
                    print(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }

        }
    }
}
