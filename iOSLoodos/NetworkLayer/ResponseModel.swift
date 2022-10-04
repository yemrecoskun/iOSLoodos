//
//  ResponseModel.swift
//  iOSLoodos
//
//  Created by Yunus Emre Coskun  on 30.09.2022.
//

import Foundation

struct ResponseModel <T: Decodable> {
    init (isStatus: Status, response: T? = nil) {
        self.isStatus = isStatus
        self.response = response
    }
    public let isStatus : Status?
    public let response : T?
}
