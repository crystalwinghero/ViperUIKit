//
//  File.swift
//  
//
//  Created by Buzzwoo MBP on 21/4/21.
//

import UIKit

/// Call this to set root view controller in
/// i.e. application(_:, didFinishLaunchingWithOptions:)
private func setRootVC(on window : UIWindow) {
    /**
     Use router to:
     - create view controller
     - create + linking presenter, router, and interactor
     */
    let vc = SampleRouter.create()
    let nav = UINavigationController(rootViewController: vc)
    window.rootViewController = nav
    window.makeKeyAndVisible()
}
