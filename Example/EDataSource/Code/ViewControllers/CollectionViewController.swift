//
//  CollectionViewController.swift
//  EDataSource_Example
//
//  Created by Borja Igartua Pastor on 31/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import EDataSource

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: DataSourceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let add = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(adding))
               let remove = UIBarButtonItem(title: "remove", style: .plain, target: self, action: #selector(removing))
               let update = UIBarButtonItem(title: "update", style: .plain, target: self, action: #selector(updating))
               let get = UIBarButtonItem(title: "get", style: .plain, target: self, action: #selector(getting))
               self.navigationItem.setRightBarButtonItems([add, remove, update, get], animated: false)
        
        collectionView.register(cellType: LightCCell.self)
        collectionView.register(cellType: ExtendedCCell.self)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 110, height: 120)
        collectionView.collectionViewLayout = layout
        self.dataSource = CollectionDataSource(collectionView: collectionView, source: [1,2,3,4,5,6])
    }
    
    //MARK: - Utils
    
    @objc func adding() {
        let indexes = [IndexPath(row: 0, section: 0), IndexPath(row: 2, section: 0)]
        self.dataSource.insertItems([7, 8] , at: indexes, animation: .top)
    }
    
    @objc func removing() {
        let indexes = [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0), IndexPath(row: 2, section: 0)]
        self.dataSource.deleteItems(at: indexes, animation: .fade)
    }
    
    @objc func updating() {
        let indexes = [IndexPath(row: 2, section: 0), IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)]
        self.dataSource.updateItems([10, 11, 12], at: indexes, animation: .fade)
    }
    
    @objc func getting() {
        print(self.dataSource.get(indexPath: IndexPath(row: 1, section: 0)) ?? "")
    }
}
