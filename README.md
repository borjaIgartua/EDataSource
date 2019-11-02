# EDataSource

[![CI Status](https://img.shields.io/travis/borjaigartua/EDataSource.svg?style=flat)](https://travis-ci.org/borjaigartua/EDataSource)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EDataSource.svg?style=flat)](https://cocoapods.org/pods/EDataSource)
[![License](https://img.shields.io/cocoapods/l/EDataSource.svg?style=flat)](https://cocoapods.org/pods/EDataSource)
[![Platform](https://img.shields.io/cocoapods/p/EDataSource.svg?style=flat)](https://cocoapods.org/pods/EDataSource)

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate Alamofire into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'EDataSource', '~> 1.1.1'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate EDataSource into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "borjaIgartua/EDataSource" "1.1.1"
```

## Structure

### Intent

Define a family of algorithms, encapsulate each one, and make them interchangeable. Applying Strategy patterns lets the algorithm vary independently from clients that use it.

### Motivation

Every time that we have a table view with diferent cells becomes a problem. Who decides when to draw it, where .... 
With this solution I am trying to separate all the responsabilities. The item who is on the table view will know how to draw itself, and the cell will know who to fill itself with the information of that item. 

### Participants

* `CellItemProtocol`: Protocol who implement each item inside the data source. Will decide which cell is going to be drawn.
* `DrawerProtocol`: Protocol who implement each view item. Is the one who will have know how to draw the view with the information.
* `DataSourceProtocol`: Define common CRUD methods for all the data sources.
* `TableDataSourceProtocol`: Using `UITableViewDataSource` is the one responsable to orchester all the other protocols.

## How to use

### Configuration

The items that are going to be drawn on the `UITableView` has to implement `CellItemProtocol`.

```swift
struct MyItem: CellItemProtocol {
    var reuserIdentifier: String {
        return "MyCellReuseIdentifier"
    }
}
```
*In my example* I am using [Reusable](https://github.com/AliSoftware/Reusable) framework to handle this identifiers.

```swift
struct MyItem: CellItemProtocol {
    var reuserIdentifier: String {
        return MyCell.reuseIdentifier
    }
}
```
The `UITableViewCells` has to implement `DrawerProtocol`.

```swift
class CustomCell : UITableViewCell, DrawerProtocol {

    func fill(withItem item: CellItemProtocol) {
        guard let item = item as? MyItem else {
            return
        }
    }
}
```
Or you can use the typealias `RegisteredTableCell`.

```swift
class CustomCell : RegisteredTableCell {

    func fill(withItem item: CellItemProtocol) {
        guard let item = item as? MyItem else {
            return
        }
    }
}
```
### Default

If you do not need any special behaviour on your `UITableView` use a `TableDataSource` class and *register the cells* that you are going to use as we usually do.

```swift
var dataSource: DataSourceProtocol!
dataSource = TableDataSource(tableView: self.tableView)
```

Or you can create the data source with data. *Do not foget* that your items inside _source_ array *has to* implement `CellItemProtocol`.

```swift
var dataSource: DataSourceProtocol!
dataSource = TableDataSource(tableView: tableView, source: [MyItem(), MyItem()])
```
Use the CRUD mehods as you wish.

```swift
let indexes = [IndexPath(row: 0, section: 0), IndexPath(row: 2, section: 0)]
self.dataSource.insertItems([MyItem(), MyItem()] , at: indexes, animation: .top)

let indexes = [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0), IndexPath(row: 2, section: 0)]
self.dataSource.deleteItems(at: indexes, animation: .fade)

let indexes = [IndexPath(row: 2, section: 0), IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)]
self.dataSource.updateItems([MyItem(), MyItem(), MyItem()], at: indexes, animation: .fade)

self.dataSource.get(indexPath: IndexPath(row: 1, section: 0))
```
### Custom

For a custom implementation you have different options

* You can inherit from `TableDataSource` and create you own data source.

```swift
class CustomDataSource: TableDataSource {
    required init(tableView: UITableView?, source: [CellItemProtocol]?) {
        tableView?.register(MyCell.self, forCellReuseIdentifier: "MyCellReuseIdentifier")
        super.init(tableView: tableView, source: source)
    }
}
```

* You can create you completely custom implementation of  `TableViewDataSourceProtocol` or   `DataSourceProtocol`.

```swift
class CustomTableDataSource: TableViewDataSourceProtocol {
}

class CustomDataSource: DataSourceProtocol {
}
```

### UICollectionView

EDataSource supports collection views on the same way, implement in your `UICollectionViewCells` the `DrawerProtocol` and on your items `CellItemProtocol`. You can choose between implement your data source with the `CollectionDataSourceProtocol` directly on `DataSourceProtocol` or use/inherit from `CollectionDataSource`.

### TODO

- [ ] Implement animations for insert/remove on `CollectionDataSource`

### Example

To run the example project, clone the repo, and run `pod install`  from the Example directory first.


## License

EDataSource is available under the MIT license. See the LICENSE file for more info.
