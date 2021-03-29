//
//  BasePresenter.swift
//
//
//  Created by crystalwinghero on 29/3/21.
//

import UIKit

public protocol BasePresenter : class {
    associatedtype View : PresentableView
    associatedtype Interactor : BaseInteractor
    associatedtype Entity : BaseEntity
    associatedtype Router : BaseRouter
    
    var view : View! { get set }
    var interactor : Interactor! { get set }
    var router : Router! { get set }
    var item : Entity? { get set }
    var list : [Entity] { get set }
    
    func setup()
    func loadContent()
    func reloadContent()
    
    init()
    init(_ view : View!, _ interactor : Interactor, _ router : Router)
    
    static func createRouter() -> Router
    static func createInteractor() -> Interactor
}
public extension BasePresenter {
    init(_ view :View!) {
        self.init(view, Self.createInteractor(), Self.createRouter())
    }
    init(_ view : View!, _ interactor : Interactor, _ router : Router) {
        self.init()
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    static func createRouter() -> Router { Router() }
    static func createInteractor() -> Interactor { Interactor() }
}

public protocol BaseTablePresenter : BasePresenter where View: TablePresentableView {
    var tableView : UITableView! { get }
}
public extension BaseTablePresenter {
    var tableView : UITableView! { view.tableView }
    
}
