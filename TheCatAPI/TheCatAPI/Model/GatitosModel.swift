//
//  GatitosModel.swift
//  TheCatAPI
//
//  Created by John on 11/11/22.
//

import Foundation

struct GatitosModel: Codable {
    var id: String?
    var name: String?
    var temperament: String?
    var description: String?
    var image: ImagesModel?
}

struct ImagesModel: Codable {
    var url: String?
}
