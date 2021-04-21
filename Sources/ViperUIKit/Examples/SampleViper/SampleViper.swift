//
//  File.swift
//  
//
//  Created by Buzzwoo MBP on 21/4/21.
//

import Foundation

///Main Viper struct to linked with others
struct SampleViper : BaseViper {
    typealias View = SampleViewController
    typealias Interactor = SampleInteractor
    typealias Presenter = SamplePresenter
    typealias Entity = SampleEntity
    typealias Router = SampleRouter
}
