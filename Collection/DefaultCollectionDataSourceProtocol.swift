//
//  DefaultCollectionDataSourceProtocol.swift
//  EDataSource
//
//  Created by Borja Igartua Pastor on 31/10/2019.
//

import Foundation

extension CollectionDataSourceProtocol {
    
    public func updateDataSource(_ source: [CellItemProtocol]) {
        self.source = source
        self.collectionView?.reloadData()
    }
    
    public func get(indexPath: IndexPath) -> CellItemProtocol? {
        return self.source[safe: indexPath.row]
    }
    
    public func insertItems(_ items: [CellItemProtocol], at indexPaths: [IndexPath]?, animation: UITableView.RowAnimation) {
        
        guard let indexPaths = indexPaths else {
            self.source.append(contentsOf: items)
            let indexPaths = items.enumerated().map { IndexPath(row: (self.source.count - 1) + $0.offset, section: 0) }
            self.collectionView?.insertItems(at: indexPaths)
            return
        }

        let indexes = indexPaths.map { $0.row }
        var insertingItems = items

        indexes.forEach { self.source.insert(insertingItems.removeFirst(), at: $0)}
        self.collectionView?.insertItems(at: indexPaths)
    }
    
    public func deleteItems(at indexPaths: [IndexPath], animation: UITableView.RowAnimation) {
        let indexes = Set(indexPaths.map { $0.row })
        let newSource = self.source.enumerated().filter { !indexes.contains($0.offset)  }

        self.source = newSource.map { $0.element }
        self.collectionView?.deleteItems(at: indexPaths)        
    }
    
    public func updateItems(_ items: [CellItemProtocol], at indexPaths: [IndexPath], animation: UITableView.RowAnimation) {
        let indexes = indexPaths.map { $0.row }
        var updating = items
        indexes.forEach { self.source[$0] = updating.removeFirst() }

        self.collectionView?.reloadItems(at: indexPaths)
    }
}
