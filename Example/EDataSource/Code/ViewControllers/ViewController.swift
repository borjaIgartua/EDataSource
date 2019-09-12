//
//  ViewController.swift
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
import EDataSource

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: DataSourceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let add = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(adding))
        let remove = UIBarButtonItem(title: "remove", style: .plain, target: self, action: #selector(removing))
        let update = UIBarButtonItem(title: "update", style: .plain, target: self, action: #selector(updating))
        let get = UIBarButtonItem(title: "get", style: .plain, target: self, action: #selector(getting))
        
        self.navigationItem.setRightBarButtonItems([add, remove, update, get], animated: false)
        
        dataSource = CustomDataSource(tableView: tableView, source: ["one", "two", "three", "caramba!"])
    }
    
    //MARK: - Utils
    
    @objc func adding() {
        let indexes = [IndexPath(row: 0, section: 0), IndexPath(row: 2, section: 0)]
        self.dataSource.insertItems(["0", "2"] , at: indexes, animation: .top)
    }
    
    @objc func removing() {
        let indexes = [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0), IndexPath(row: 2, section: 0)]
        self.dataSource.deleteItems(at: indexes, animation: .fade)
    }
    
    @objc func updating() {
        let indexes = [IndexPath(row: 2, section: 0), IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)]
        self.dataSource.updateItems(["update -> 1", "update -> 2", "update -> 3"], at: indexes, animation: .fade)
    }
    
    @objc func getting() {
        print(self.dataSource.get(indexPath: IndexPath(row: 1, section: 0)) ?? "")
    }
    
}

