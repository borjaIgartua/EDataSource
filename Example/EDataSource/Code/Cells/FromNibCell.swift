//
//  FromNibCell.swift
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

import EDataSource
import Reusable

class FromNibCell: RegisteredCell, Reusable, NibLoadable {
    
    @IBOutlet weak var bulletLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    func fill(withItem item: CellItemProtocol) {
        guard let item = item as? String else {
            return
        }
        
        print("filling FromNibCell")
        
        bulletLabel.text = "🐽: "
        titleLabel.text = item
        bottomLabel.text = "👯‍♂️ 👯‍♀️ 👯‍♂️ 👯‍♀️ 👯‍♂️ 👯‍♀️ 👯‍♂️ 👯‍♀️ 👯‍♂️ 👯‍♀️"
    }
}
