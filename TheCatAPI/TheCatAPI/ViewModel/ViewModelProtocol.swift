//
//  ViewModelProtocol.swift
//  TheCatAPI
//
//  Created by John on 15/11/22.
//

import Foundation

protocol ViewModelProtocol: AnyObject {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
}
