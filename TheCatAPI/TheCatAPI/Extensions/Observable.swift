//
//  Observable.swift
//  TheCatAPI
//
//  Created by John on 15/11/22.
//

import Foundation

public final class Observable<T> {
    public typealias Listener = (T) -> Void
    public var listener: Listener?
    
    public func bind( listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    public var value: T {
        didSet {
            listener?(value)
        }
    }
    
    public init(_ object: T) {
        value = object
    }
}
