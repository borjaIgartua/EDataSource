//
//  DataSourceProtocol.swift
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

public typealias RegisteredCell = UITableViewCell & DrawerProtocol

/// DataSource protocol, implement to fill the cells
///
public protocol DataSourceProtocol: UITableViewDataSource {
    var source: [CellItemProtocol] { get set }
    var tableView: UITableView? { get set }

    init(tableView: UITableView?,
         source: [CellItemProtocol]?)
    
    /// Update the source and reloadData for the table
    ///
    /// - Parameter source: array of items to update the table view
    func updateDataSource(_ source: [CellItemProtocol])
    
    /// Return the item at the given indexPath
    ///
    /// - Parameter indexPath: The actual index path on the table view
    /// - Returns: The item inside that index path
    func get(indexPath: IndexPath) -> CellItemProtocol?
    
    /// Insert items at index paths and added to the table view.
    /// If there is not index paths, the items are added at the end of the sources
    ///
    /// - Parameter items: The items to add on the sources
    /// - Parameter indexPaths: The index paths to add that sources
    /// - Parameter animation: The animation for the table view
    func insertItems(_ items: [CellItemProtocol], at indexPaths: [IndexPath]?, animation: UITableView.RowAnimation)
    
    /// Delete items at index paths.
    ///
    /// - Parameter indexPaths: The index paths to delete the items
    /// - Parameter animation: The animation for the table view
    func deleteItems(at indexPaths: [IndexPath], animation: UITableView.RowAnimation)
    
    /// Update items at index paths and reload the cells to the table view.
    ///
    /// - Parameter items: The items to add on the sources
    /// - Parameter indexPaths: The index paths to add that sources in the table view
    /// - Parameter animation: The animation for the table view
    func updateItems(_ items: [CellItemProtocol], at indexPaths: [IndexPath], animation: UITableView.RowAnimation)
}
