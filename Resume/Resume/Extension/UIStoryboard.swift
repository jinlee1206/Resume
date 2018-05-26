//
//  UIStoryboard.swift
//  Resume
//
//  Created by ROGER on 2018. 5. 25..
//  Copyright © 2018년 Hexcon. All rights reserved.
//

import Foundation
import UIKit



protocol InstantiableFromStoryboard {}

extension InstantiableFromStoryboard {
    static func fromStoryboard(name: String = "Main", bundle: Bundle? = nil) -> Self {
        let identifier = String(describing: self)
        guard let viewController = UIStoryboard(name: name, bundle: bundle).instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Cannot instantiate view controller of type " + identifier)
        }
        return viewController
    }
}

extension UIViewController: InstantiableFromStoryboard {}
