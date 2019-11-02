//
//  Int+CellItemProtocol.swift
//  EDataSource_Example
//
//  Created by Borja Igartua Pastor on 01/11/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import EDataSource

extension Int: CellItemProtocol {
    public var reuserIdentifier: String {
        return (self % 2) == 0 ? ExtendedCCell.reuseIdentifier : LightCCell.reuseIdentifier
    }
}
