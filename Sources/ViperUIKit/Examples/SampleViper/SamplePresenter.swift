//
//  File.swift
//  
//
//  Created by Buzzwoo MBP on 21/4/21.
//

import Foundation

///NOTE: mark as final class + inherits from NSObject
final class SamplePresenter : NSObject, BasePresenter {
    //1. declare type
    typealias Viper = SampleViper
    
    //2. declare variables for your VIPER
    //NOTE: always weak, to prevent retain cycle
    weak var view : Viper.View!
    var interactor: Viper.Interactor!
    var router: Viper.Router!
    var item : Viper.Entity?
    var list : [Viper.Entity] = []
    
    //3. default methods
    func setup() {
        //TODO: add your setup, i.e. navigation title, tableview data source, etc.
    }
    func loadContent() {
        //TODO: fetch your data
        interactor.fetch { (_) in
            //TODO: refresh UI
        }
    }
    func reloadContent() {
        //TODO: add reload method
    }
}
