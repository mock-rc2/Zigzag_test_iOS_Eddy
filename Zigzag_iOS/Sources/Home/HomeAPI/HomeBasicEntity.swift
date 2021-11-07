//
//  HomeBasicEntity.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/07.
//

import Foundation

struct HomeBasicEntity: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [HomeBasicItemInfo]
}

struct HomeBasicItemInfo: Decodable {
    var productIdx: Int
    var storeName: String
    var productImg: [String]?
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
