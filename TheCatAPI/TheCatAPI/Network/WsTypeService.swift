//
//  WsTypeService.swift
//  TheCatAPI
//
//  Created by John on 06/11/22.
//

import Foundation

// MARK: - WsTypeService
enum WsTypeService: String, CaseIterable {
    case raca
    case image

    public var urlTypeService: String {
        switch self {
        case .raca:
            gatitosBaseUrl = URLBase.currentUrl()
            return gatitosBaseUrl
        case .image:
            gatitosBaseUrl = URLBase.currentUrl()
            return gatitosBaseUrl
        }
    }
}
