//
//  UserInfoEntity.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/11.
//

import Foundation

struct UserInfoEntity: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: UserInfo?
}

struct UserInfo: Decodable {
    var userIdx: Int
    var name: String?
    var email: String
    var membershipType: String
    var orderDeliveryCount: String
    var reviewCount: String
    var couponCount: String
    var point:  String
}

struct WithDrawEntity: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: String
}
