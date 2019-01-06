//
//  UITableView+Helpers.swift
//
//  Created by Beniamin Sarkisian on 04/01/2019.
//  Copyright © 2019 bsarkisian.me. All rights reserved.
//

import UIKit

public extension UITableView {

    var fullContentSize: CGSize {
        var contentSize = self.contentSize
        
        if contentSize.height > 0 {
            contentSize.width += contentInset.left + contentInset.right
            contentSize.height += contentInset.top + contentInset.bottom
        }
        
        return contentSize
    }
    
    func selecteRow(at index: Int, section: Int = 0, animated: Bool = false) {
        let indexPath = IndexPath(row: index, section: section)
        selectRow(at: indexPath, animated: animated, scrollPosition: .none)
    }
    
    func reloadData(completion: @escaping VoidClosure) {
        UIView.animate(withDuration: Animation.none.rawValue, animations: {
            self.reloadData()
        }) { _ in
            completion()
        }
    }
    
}
