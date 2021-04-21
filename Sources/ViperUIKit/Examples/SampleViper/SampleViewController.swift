//
//  File.swift
//  
//
//  Created by Buzzwoo MBP on 21/4/21.
//

import UIKit

class SampleViewController : UIViewController, PresentableView {
    //1. declare type
    typealias Viper = SampleViper
    
    //2. declare presenter
    var presenter: Viper.Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //3. call setup
        presenter.setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //4. load content
        presenter.loadContent()
    }
    
    
}
