//
//  BaseInteractor.swift
//
//
//  Created by crystalwinghero on 29/3/21.
//
#if !os(macOS)
import Combine

public protocol DataFetchable {
  associatedtype Input
  associatedtype Response
  
  func fetch() -> AnyPublisher<Response,Never>
  func fetch(_ input : Input?) -> AnyPublisher<Response,Never>
}

public extension DataFetchable {
  func fetch() -> AnyPublisher<Response,Never> {
    self.fetch(nil)
  }
}
#endif

public protocol BaseInteractor {
  init()
}
