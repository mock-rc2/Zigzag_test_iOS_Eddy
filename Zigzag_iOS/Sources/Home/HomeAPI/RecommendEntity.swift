//
//  RecommendEntity.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/10.
//

import Foundation

struct RecommendEntity: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [RecommendItemInfo]
}

struct RecommendItemInfo: Decodable {
    var productIdx: Int
    var storeName: String
    var productImg: [String]
    var productName: String
    var price: Int
    var discountRate: Int
    var shippingCost: Int
    var isNew: String
    var isQuick: String
    var isBrand: String
    var isZdiscount: String
    var categoryIdx: Int
    var mainCategory: String
}
