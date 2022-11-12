//
//  URLBase.swift
//  TheCatAPI
//
//  Created by John on 06/11/22.
//

import Foundation

struct URLBase {
    private static let environmentFile = Bundle.main.path(forResource: "environment", ofType: "plist")

    static func currentUrl() -> String {
        if let environmentFile = environmentFile {
            if let environmentDictionary = NSDictionary(contentsOfFile: environmentFile) {
                return environmentDictionary["gatitosBaseUrl"] as? String ?? ""
            }
        }
        return ""
    }
}

var gatitosBaseUrl = URLBase.currentUrl()
let gatitosTimeOut = 120.0
let gatitosCacheControl = "private, no-cache, no-store"
let gatitosKey = "c0f41c38-f785-480d-9c66-ae2359cbaea3"
