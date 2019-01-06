//
//  TableCellModelProtocol.swift
//
//  Created by Beniamin Sarkisian on 04/01/2019.
//  Copyright © 2019 bsarkisian.me. All rights reserved.
//

import UIKit

public protocol TableCellModelProtocol {
    
    static var cellIdentifier: String { get }
    static var cellNib: UINib { get }
    
    var cellIdentifier: String { get }
    var cellNib: UINib { get }
    
    var cellHeight: CGFloat { get }
    var estimatedCellHeight: CGFloat? { get }
    
}

public extension TableCellModelProtocol {
    
    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }
    
    var estimatedCellHeight: CGFloat? {
        return nil
    }
    
}
