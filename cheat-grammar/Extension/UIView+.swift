//
//  UIView+.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/10/04.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit


/// UIViewの親VCを探して返す
extension UIView {
    func parentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            parentResponder = nextResponder
        }
    }

}
