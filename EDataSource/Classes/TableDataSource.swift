//
//  DataSource.swift
//
//  Copyright © 2019 Borja Igartua.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

open class TableDataSource: NSObject, TableDataSourceProtocol {
    public var source: [CellItemProtocol]
    public weak var tableView: UITableView?
    
    public required init(tableView: UITableView?,
                         source: [CellItemProtocol]? = nil) {
        
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
