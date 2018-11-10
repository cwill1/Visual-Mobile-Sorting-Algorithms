//
//  quickSort.swift
//  Williams_C_Assignment1
//
//  Created by CWILL on 4/18/18.
//  Copyright © 2018 DePaul. All rights reserved.
//

import Foundation
class quickSort{
    var arraySize:[Int] = []
    var arrayView:ArrayView!
    
    init(){}
    init(_ arraySize:inout[Int], _ arrayView:ArrayView){
        self.arraySize = arraySize;
        self.arrayView = arrayView;
    }
    init( _ arrayView:ArrayView){
        self.arrayView = arrayView;
    }
    func populateWithData(_ a: [Int]){
        arraySize = a
    }
    func quicksort<T: Comparable>(_ a: inout [T]) {
        quicksort(&a, 0, a.count - 1)
    }
    func quicksort<T: Comparable>( _ a: inout [T], _ low: Int, _ high: Int) {
        if low < high {
            let part = partion(&a, low: low, high: high)
            quicksort(&a, low, part - 1)
            quicksort(&a, part + 1, high)
        }
    }
    func swap<T>( _ arr: inout [T], a: Int, b: Int) {
        let temp = arr[a]
        arr[a] = arr[b]
        arr[b] = temp
        DispatchQueue.main.async{
            self.arrayView.setNeedsDisplay()
        }
        usleep(quick_sort_delay)
    }

    func partion<T: Comparable>(_ arr: inout [T], low: Int, high: Int) -> Int {
        let myPivot = arr[high]
        var myIndex = low
        for i in low..<high {
            if arr[i] < myPivot {
                swap( &arr, a: i, b: myIndex)
                myIndex += 1
            }
            DispatchQueue.main.async{
                self.arrayView.setNeedsDisplay()
            }
            usleep(quick_sort_delay)
        }
        swap(&arr, a: myIndex, b: high)
        return myIndex
    }
    
}
