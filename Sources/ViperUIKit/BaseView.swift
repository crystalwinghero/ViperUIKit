//
//  BaseView.swift
//
//
//  Created by crystalwinghero on 29/3/21.
//

import UIKit

public protocol PresentableView : AnyObject {
    associatedtype Viper : BaseViper
    var presenter : Viper.Presenter! { get set }
    var item : Viper.Entity? { get set }
    var list : [Viper.Entity] { get set }
    func setup()
    func loadContent()
    func reloadContent()
}
public extension PresentableView {
    var item : Viper.Entity? {
        get { presenter.item }
        set { presenter.item = newValue }
    }
    var list : [Viper.Entity] {
        get { presenter.list }
        set { presenter.list = newValue }
    }
}
public extension PresentableView {
    func setup() { presenter.setup() }
    func loadContent() { presenter.loadContent() }
    func reloadContent() { presenter.reloadContent() }
}

public protocol TablePresentableView : PresentableView where Viper.Presenter: BaseTablePresenter {
    var tableView : UITableView! { get set }
}
