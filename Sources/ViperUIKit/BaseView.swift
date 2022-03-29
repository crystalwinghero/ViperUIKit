//
//  BaseView.swift
//
//
//  Created by crystalwinghero on 29/3/21.
//

#if !os(macOS)
import UIKit

public protocol BaseTableView : BaseView {
  var tableView : UITableView! { get set }
}

#endif

public protocol BaseView : AnyObject {
  associatedtype Viper : BaseViper
  var presenter : Viper.Presenter! { get set }
}

