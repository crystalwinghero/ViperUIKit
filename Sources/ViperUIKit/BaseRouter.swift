//
//  BaseRouter.swift
//
//
//  Created by crystalwinghero on 29/3/21.
//

import UIKit

public protocol BaseRouter {
    associatedtype T : UIViewController, PresentableView
    
    init()
    static func create() -> T
}

public extension BaseRouter where T.Presenter.View == Self.T {
    static func create() -> T {
        return createWithNib()
    }
    static func createWithNib() -> T {
        let vc = T.instanceFromNib()
        let presenter = T.Presenter(vc)
        vc.presenter = presenter
        return vc
    }
    static func createWithStoryboard() -> T {
        let vc = T.instanceFromStoryboard()
        let presenter = T.Presenter(vc)
        vc.presenter = presenter
        return vc
    }
}
