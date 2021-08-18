//
//  BaseInteractor.swift
//
//
//  Created by crystalwinghero on 29/3/21.
//

import Foundation

public protocol BaseInteractor {
    associatedtype Input
    associatedtype Response
    init()
    func fetch(_ input : Input?, _ completion : @escaping (Response)->Void)
    func fetch(_ completion : @escaping (Response)->Void)
}

public extension BaseInteractor {
    func fetch(_ completion : @escaping (Response)->Void) {
        self.fetch(nil, completion)
    }
}
