//
//  TableSectionModel.swift
//
//  Created by Beniamin Sarkisian on 04/01/2019.
//  Copyright © 2019 bsarkisian.me. All rights reserved.
//

import RxDataSources

public struct TableSectionModel {
    
    public var header: String?
    public var items: [Item]
    
    public init(header: String? = nil, items: [Item]) {
        self.header = header
        self.items = items
    }
    
}

extension TableSectionModel: SectionModelType {
    
    public typealias Item = TableCellModelProtocol
    
    public init(original: TableSectionModel, items: [Item]) {
        self = original
        self.items = items
    }
    
}
