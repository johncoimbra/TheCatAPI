//
//  Connectivity.swift
//  TheCatAPI
//
//  Created by John on 06/11/22.
//

import Foundation
import Alamofire

// MARK: - Retorna valor [Bool] se user esta conectado com a internet.
class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
