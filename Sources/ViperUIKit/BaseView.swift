//
//  BaseView.swift
//
//
//  Created by crystalwinghero on 29/3/21.
//

import UIKit

protocol PresentableView : class {
    associatedtype Presenter : BasePresenter
    var presenter : Presenter! { get set }
    var item : Presenter.Entity? { get set }
    var list : [Presenter.Entity] { get set }
    func setup()
    func loadContent()
    func reloadContent()
}
extension PresentableView {
    var item : Presenter.Entity? {
        get { presenter.item }
        set { presenter.item = newValue }
    }
    var list : [Presenter.Entity] {
        get { presenter.list }
        set { presenter.list = newValue }
    }
    func setup() { presenter.setup() }
    func loadContent() { presenter.loadContent() }
    func reloadContent() { presenter.reloadContent() }
}

protocol TablePresentableView : PresentableView where Presenter: BaseTablePresenter {
    var tableView : UITableView! { get set }
}
extension TablePresentableView {
    
}
