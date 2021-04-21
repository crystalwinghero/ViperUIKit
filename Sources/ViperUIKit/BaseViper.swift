//
//  File.swift
//  
//
//  Created by Buzzwoo MBP on 21/4/21.
//

import Foundation

public protocol BaseViper {
    associatedtype View : PresentableView where View.Viper == Self
    associatedtype Interactor : BaseInteractor
    associatedtype Presenter : BasePresenter where Presenter.Viper == Self
    associatedtype Entity : BaseEntity
    associatedtype Router : BaseRouter
}
