//
//  TableViewDataSource.swift
//
//  Created by Beniamin Sarkisian on 04/01/2019.
//  Copyright © 2019 bsarkisian.me. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

open class TableViewDataSource: NSObject {
    
    // MARK: - Public variables
    
    // Input
    public private(set) var models = BehaviorRelay<[TableSectionModel]>(value: [])
    
    // Output
    public private(set) var onSelectCell = PublishRelay<(IndexPath, TableCellModelProtocol)>()
    
    // MARK: - Private variables
    
    private lazy var dataSource: RxTableViewSectionedReloadDataSource<TableSectionModel> = {
        return RxTableViewSectionedReloadDataSource<TableSectionModel>(
            configureCell: { dataSource, tableView, indexPath, model in
                let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath)
                
                if var cell = cell as? TableCellProtocol {
                    cell.model = model
                }
                
                return cell
            }
        )
    }()
    
    private(set) weak var tableView: UITableView?
    private(set) var disposeBag = DisposeBag()
    
    // MARK: - Public functions
    
    open func setup(with tableView: UITableView) {
        self.tableView = tableView
        
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        models
            .do(onNext: { [weak self] sections in
                sections.forEach {
                    $0.items.forEach {
                        self?.tableView?.register($0.cellNib, forCellReuseIdentifier: $0.cellIdentifier)
                    }
                }
            })
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
}

// MARK: - UITableViewDelegate

extension TableViewDataSource: UITableViewDelegate {
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models.value[indexPath.section].items[indexPath.row]
        onSelectCell.accept((indexPath, model))
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return models.value[indexPath.section].items[indexPath.row].cellHeight
    }
    
    open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = models.value[indexPath.section].items[indexPath.row]
        return model.estimatedCellHeight ?? model.cellHeight
    }
    
}
