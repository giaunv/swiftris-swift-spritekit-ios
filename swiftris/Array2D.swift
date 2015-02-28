//
//  Array2D.swift
//  swiftris
//
//  Created by lavalamp on 2/28/15.
//  Copyright (c) 2015 366. All rights reserved.
//

import Foundation

// #1
class Array2D<T>{
    let columns: Int
    let rows: Int

// #2
    var array: Array<T?>
    
    init(columns: Int, rows: Int){
        self.columns = columns
        self.rows = rows
        
// #3
        array = Array<T?>(count:rows*columns, repeatedValue: nil)
    }
    
// #4
    subscript(column: Int, rows: Int) -> T?{
        get{
            return array[(rows*columns) + columns]
        }
        set(newValue){
            array[(rows*columns) + columns] = newValue
        }
    }
    
}
