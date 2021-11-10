//
//  StoreEntity.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/11.
//

import Foundation

struct StoreEntity: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [StoreRankingInfo]
}

struct StoreRankingInfo: Decodable {
    var storeIdx: Int
    var storeImg: String
    var storeName: String
    var ageGroup: [String]
    var style: [String]
    var likeNum: Int
    var freeDelivery: Bool
    var maxCouponPrice: Int
}
