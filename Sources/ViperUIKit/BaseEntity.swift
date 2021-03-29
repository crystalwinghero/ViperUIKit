//
//  BaseEntity.swift
//  
//
//  Created by crystalwinghero on 29/3/21.
//

import Foundation

public protocol BaseEntity : Equatable {
    associatedtype PK : Equatable
    var pk : PK { get }
}
extension BaseEntity {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.pk == rhs.pk
    }
}

