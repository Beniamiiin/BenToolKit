//
//  UIAlertController+EasyApi.swift
//
//  Created by Beniamin Sarkisian on 04/01/2019.
//  Copyright © 2019 bsarkisian.me. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    static func showAlert(title: String, message: String? = nil, in view: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: nil))
        view.present(alertController, animated: true, completion: nil)
    }
    
}
