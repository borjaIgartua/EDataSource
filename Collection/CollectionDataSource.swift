//
//  CollectionDataSource.swift
//  EDataSource
//
//  Created by Borja Igartua Pastor on 31/10/2019.
//

import Foundation

open class CollectionDataSource: NSObject, CollectionDataSourceProtocol {
    public var source: [CellItemProtocol]
    public weak var collectionView: UICollectionView?
    
    public required init(collectionView: UICollectionView?, source: [CellItemProtocol]?) {        
        self.source = source ?? []
        self.collectionView = collectionView
        super.init()
        
        self.collectionView?.dataSource = self
        if source != nil {
            self.collectionView?.reloadData()
        }
    }
        
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.source.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = source[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.reuserIdentifier, for: indexPath) as? RegisteredCollectionCell else {
            fatalError("All the cell inside table view should implement DrawerProtocol")
        }

        cell.fill(withItem: item)
        return cell
    }
}
