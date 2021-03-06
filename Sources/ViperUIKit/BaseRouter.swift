//
//  BaseRouter.swift
//
//
//  Created by crystalwinghero on 29/3/21.
//

import UIKit

public protocol BaseRouter {
    associatedtype Viper : BaseViper
    
    init()
    static func create() -> Viper.View
}

public extension BaseRouter where Viper.View : UIViewController {
    static func create() -> Viper.View {
        return createWithNib()
    }
    static func createWithNib() -> Viper.View {
        let vc = Viper.View.instanceFromNib()
        let presenter = Viper.Presenter(vc)
        vc.presenter = presenter
        return vc
    }
    static func createWithStoryboard() -> Viper.View {
        let vc = Viper.View.instanceFromStoryboard()
        let presenter = Viper.Presenter(vc)
        vc.presenter = presenter
        return vc
    }
}
