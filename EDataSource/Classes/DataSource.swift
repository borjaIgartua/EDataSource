//
//  DataSource.swift
//  Datasource
//
//  Created by Borja Igartua Pastor on 07/09/2019.
//

import Foundation

open class DataSource: NSObject, DataSourceProtocol {
    public var source: [CellItemProtocol]
    public weak var tableView: UITableView?
    
    public required init(tableView: UITableView?,
                         source: [CellItemProtocol]?) {
        
        self.tableView = tableView
        self.source = source ?? []
        super.init()
                
        self.tableView?.dataSource = self
        if source != nil {
            self.tableView?.reloadData()
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = source[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: item.reuserIdentifier, for: indexPath) as? RegisteredCell else {
            fatalError("All the cell inside table view should implement DrawerProtocol & Reusable")
        }
        
        cell.fill(withItem: item)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.source.count
    }
}
