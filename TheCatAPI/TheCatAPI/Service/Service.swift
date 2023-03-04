//
//  Service.swift
//  TheCatAPI
//
//  Created by John on 12/11/22.
//

import Foundation
import Alamofire

class Service {
    static let shared = Service()
    
    // MARK: - Get Breeds
    func fetchBreed(onComplete: @escaping ([GatitosModel]?) -> Void) {
        let url: String
        url = "\(Constants.shared.urlBase)breeds?api_key=\(Constants.shared.apiKey)"
        AF.request(url, method: .get, encoding: URLEncoding.default)
        .response { response in
            switch response.result {
            case .success:
                guard let data = response.data else {
                    onComplete(nil)
                    return
                }
                do {
                    let gatitosInfo = try JSONDecoder().decode([GatitosModel].self, from: data)
                    onComplete(gatitosInfo)
                } catch {
                    print(error.localizedDescription)
                    onComplete(nil)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchBreedImage(onComplete: @escaping ([GatitosModel]?) -> Void) {
            let url: String
            url = "\(Constants.shared.urlBase)breeds?api_key=\(Constants.shared.apiKey)"
            AF.request(url, method: .get, encoding: URLEncoding.default)
            .response { response in
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        onComplete(nil)
                        return
                    }
                    do {
                        let gatitosInfo = try JSONDecoder().decode([GatitosModel].self, from: data)
                        onComplete(gatitosInfo)
                    } catch {
                        print(error.localizedDescription)
                        onComplete(nil)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
}
