//
//  BaseInteractor.swift
//
//
//  Created by crystalwinghero on 29/3/21.
//

import Foundation

public protocol BaseInteractor {
    associatedtype Response
    associatedtype Object
    init()
    func fetch(_ completion : @escaping (Response)->Void)
    func submit(_ data : Object, _ completion : @escaping (Response)->Void)
}
