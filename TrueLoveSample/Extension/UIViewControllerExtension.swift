//
//  UIViewControllerExtension.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/6.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import UIKit

@objc extension UIView {
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle.main)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
}
