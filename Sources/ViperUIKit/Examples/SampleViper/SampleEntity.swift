//
//  File.swift
//  
//
//  Created by Buzzwoo MBP on 21/4/21.
//

import Foundation

struct SampleEntity : BaseEntity {
    typealias PK = Int
    var pk : PK { id }
    var id : Int
}
