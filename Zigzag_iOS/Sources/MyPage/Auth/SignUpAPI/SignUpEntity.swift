//
//  SignUpEntity.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/03.
//

import Foundation

struct SignUpEntity: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: UserToken?
}

struct UserToken: Decodable {
    var jwt: String
    var userIdx: Int
}
