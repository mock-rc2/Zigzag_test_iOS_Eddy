//
//  BookMarkEntity.swift
//  Zigzag_iOS
//
//  Created by 권준상 on 2021/11/11.
//

import Foundation

struct BookMarkEntity: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: BookMarkResult
}

struct BookMarkResult: Decodable {
    var count: Int
    var getFavoriteStoreResList: [BookMarkInfo]
}

struct BookMarkInfo: Decodable {
    var storeIdx: Int
    var storeImg: String
    var storeName: String
    var maxCouponPrice: Int
    var newProductCount: Int
}

struct EditBookMarkEntity: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: String
}
