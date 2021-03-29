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

extension BaseRouter where T.Presenter.View == Self.T {
    static func create() -> T {
        let vc = T.instanceFromNib()
        let presenter = T.Presenter(vc)
        vc.presenter = presenter
        return vc
    }
}
