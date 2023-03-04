//
//  GatitosViewModel.swift
//  TheCatAPI
//
//  Created by John on 15/11/22.
//

import Foundation
import UIKit

// Pro-to-loco, tudo que eu acesso na viewController
protocol GatitosViewModelProtocol: ViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
    var breedsArray: Observable<[GatitosModel]> { get }
}

// Acessa somente o que eu preciso realmente, por isso herda do GartitosViewModelProtocol
final class GatitosViewModel: GatitosViewModelProtocol {
    var breedsArray: Observable<[GatitosModel]>
    var isLoading: Observable<Bool>
    var isError: Observable<String?>
    
    init() {
        self.isLoading = Observable(false)
        self.isError = Observable("")
        self.breedsArray = Observable([])
        fetchBreeds()
    }
    
    // MARK: - Helpers
    func fetchBreeds() {
        Service.shared.fetchBreed { response in
            self.breedsArray.value.append(contentsOf: response ?? [])
        }
    }
}
