//
//  BasePresenter.swift
//
//
//  Created by crystalwinghero on 29/3/21.
//

#if !os(macOS)
import UIKit


public extension BasePresenter where Viper.View: BaseTableView {
  var tableView : UITableView! { view.tableView }
}
#endif

public protocol BasePresenter : AnyObject {
  associatedtype Viper : BaseViper
  
  var view : Viper.View! { get set }
  var interactor : Viper.Interactor! { get set }
  var router : Viper.Router! { get set }
  
  func setup()
  func tearDown()
  
  func loadContent()
  func reloadContent()
  
  //additional methods for UIKit Life Cycle
  func onViewWillAppear()
  func onViewWillDisappear()
  func viewDidLayoutSubviews()
  
  init()
  init(_ view : Viper.View!, _ interactor : Viper.Interactor, _ router : Viper.Router)
  
  static func createRouter() -> Viper.Router
  static func createInteractor() -> Viper.Interactor
}
public extension BasePresenter {
  init(_ view : Viper.View!) {
    self.init(view, Self.createInteractor(), Self.createRouter())
  }
  init(
    _ view : Viper.View!,
    _ interactor : Viper.Interactor,
    _ router : Viper.Router
  ) {
    self.init()
    self.view = view
    self.interactor = interactor
    self.router = router
  }
  static func createRouter() -> Viper.Router { Viper.Router() }
  static func createInteractor() -> Viper.Interactor { Viper.Interactor() }
  
  //Optional func
  func onViewWillAppear() {}
  func onViewWillDisappear() {}
  func viewDidLayoutSubviews() {}
}

