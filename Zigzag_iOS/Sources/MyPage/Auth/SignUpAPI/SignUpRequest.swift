//
//  SignUpRequest.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/03.
//

import Alamofire
import UIKit

class SignUpRequest {
    func sendSignUpData(email: String, password: String, viewController: SetEmailPasswordViewController) {
        let url = "http://52.78.116.129:9000/app/users"
        let params: Parameters = [
            "email": "\(email)",
            "password": "\(password)"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: nil)
            .responseDecodable(of: SignUpEntity.self) { response in
            
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
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
}
