//
//  DefaultDataSource.swift
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

import Foundation

extension DataSourceProtocol {
    
    public func updateDataSource(_ source: [CellItemProtocol]) {
        self.source = source
        self.tableView?.reloadData()
    }
    
    public func get(indexPath: IndexPath) -> CellItemProtocol? {
        return self.source[safe: indexPath.row]
    }
    
    public func insertItems(_ items: [CellItemProtocol], at indexPaths: [IndexPath]?, animation: UITableView.RowAnimation) {
        
        guard let indexPaths = indexPaths else {
            self.source.append(contentsOf: items)
            let indexPaths = items.enumerated().map { IndexPath(row: (self.source.count - 1) + $0.offset, section: 0) }
            self.tableView?.insertRows(at: indexPaths, with: animation)
            return
        }
        
        let indexes = indexPaths.map { $0.row }
        var insertingItems = items
        
        indexes.forEach { self.source.insert(insertingItems.removeFirst(), at: $0)}
        self.tableView?.insertRows(at: indexPaths, with: animation)
    }
    
    public func deleteItems(at indexPaths: [IndexPath], animation: UITableView.RowAnimation) {
        let indexes = Set(indexPaths.map { $0.row })
        let newSource = self.source.enumerated().filter { !indexes.contains($0.offset)  }
        
        self.source = newSource.map { $0.element }
        self.tableView?.deleteRows(at: indexPaths, with: animation)
    }
    
    public func updateItems(_ items: [CellItemProtocol], at indexPaths: [IndexPath], animation: UITableView.RowAnimation) {
        let indexes = indexPaths.map { $0.row }
        var updating = items
        indexes.forEach { self.source[$0] = updating.removeFirst() }
        
        self.tableView?.reloadRows(at: indexPaths, with: animation)
    }
}
