//
//  BrandEntity.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/11.
//

import Foundation

struct BrandEntity: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [BrandRankingInfo]
}

struct BrandRankingInfo: Decodable {
    var storeIdx: Int
    var storeImg: String
    var storeName: String
    var storeCategoryName: String
    var likeNum: Int
    var freeDelivery: Bool
    var maxCouponPrice: Int
}
