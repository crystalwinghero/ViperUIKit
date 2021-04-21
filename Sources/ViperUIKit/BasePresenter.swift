//
//  BasePresenter.swift
//
//
//  Created by crystalwinghero on 29/3/21.
//

import UIKit

public protocol BasePresenter : class {
    associatedtype Viper : BaseViper
    
    var view : Viper.View! { get set }
    var interactor : Viper.Interactor! { get set }
    var router : Viper.Router! { get set }
    var item : Viper.Entity? { get set }
    var list : [Viper.Entity] { get set }
    
    func setup()
    func loadContent()
    func reloadContent()
    
    init()
    init(_ view : Viper.View!, _ interactor : Viper.Interactor, _ router : Viper.Router)
    
    static func createRouter() -> Viper.Router
    static func createInteractor() -> Viper.Interactor
}
public extension BasePresenter {
    init(_ view : Viper.View!) {
        self.init(view, Self.createInteractor(), Self.createRouter())
    }
    init(_ view : Viper.View!, _ interactor : Viper.Interactor, _ router : Viper.Router) {
        self.init()
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    static func createRouter() -> Viper.Router { Viper.Router() }
    static func createInteractor() -> Viper.Interactor { Viper.Interactor() }
}

public protocol BaseTablePresenter : BasePresenter where Viper.View: TablePresentableView {
    var tableView : UITableView! { get }
}
public extension BaseTablePresenter {
    var tableView : UITableView! { view.tableView }
    
}
