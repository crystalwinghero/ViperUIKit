//
//  File.swift
//  
//
//  Created by Buzzwoo MBP on 21/4/21.
//

import Foundation

struct SampleInteractor : BaseInteractor {
    typealias Response = Any
    
    func fetch(_ completion: @escaping (Any) -> Void) {
        //TODO: add logic here
        completion("Hello, world!")
    }
    
}
