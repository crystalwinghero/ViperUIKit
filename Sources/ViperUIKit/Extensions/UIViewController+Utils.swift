//
//  File.swift
//  
//
//  Created by Buzzwoo MBP on 29/3/21.
//

import UIKit

/*
 NOTE: https://stackoverflow.com/questions/27099054/load-uiviewcontroller-from-the-separate-nib-file-in-swift#answer-52872923
 */
extension UIViewController {
    static func instanceFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
}
