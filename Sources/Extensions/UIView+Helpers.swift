//
//  UIView+Helpers.swift
//
//  Created by Beniamin Sarkisian on 04/01/2019.
//  Copyright © 2019 bsarkisian.me. All rights reserved.
//

import UIKit

public extension UIView {
    
    var fromNib: UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}
