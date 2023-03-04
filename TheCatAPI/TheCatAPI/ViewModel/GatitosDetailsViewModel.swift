//
//  GatitosDetailsViewModel.swift
//  TheCatAPI
//
//  Created by John on 15/11/22.
//

import Foundation
import UIKit

// Pro-to-loco, tudo que eu acesso na viewController
protocol GatitosDetailsViewModelProtocol: ViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
    var breedsImageUrl: Observable<String?> { get }
    var gatitosModel: GatitosModel { get }
}

// Acessa somente o que eu preciso realmente, por isso herda do GartitosViewModelProtocol
final class GatitosDetailsViewModel: GatitosDetailsViewModelProtocol {
    var gatitosModel: GatitosModel
    var breedsImageUrl: Observable<String?>
    var isLoading: Observable<Bool>
    var isError: Observable<String?>
    
    init(object: GatitosModel) {
        self.isLoading = Observable(false)
        self.isError = Observable("")
        self.breedsImageUrl = Observable("")
        self.gatitosModel = object
    }
    
    // MARK: - Helpers
  
}
