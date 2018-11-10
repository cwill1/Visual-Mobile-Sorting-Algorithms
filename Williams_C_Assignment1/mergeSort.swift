//
//  mergeSort.swift
//  Williams_C_Assignment1
//
//  Created by CWILL on 4/18/18.
//  Copyright © 2018 DePaul. All rights reserved.
//

import Foundation

class mergeSort{
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
    func mergeSort<T: Comparable>(array: inout [T]) {
        mergeSort(&array,0,array.count-1)
    }
    func mergeSort<T: Comparable>(_ array: inout [T], _ indexStart: Int, _ indexEnd: Int) {
        // Base case
        if indexStart >= indexEnd {
            return
        }
        
        let middleIndex = (indexStart + indexEnd) / 2
        mergeSort(&array,indexStart,middleIndex)
        mergeSort(&array,middleIndex+1, indexEnd)
        merge(&array, indexStart, middleIndex, indexEnd)
    }
    func merge<T: Comparable> (_ a: inout [T], _ indexStart: Int, _ indexMiddle: Int, _ indexEnd: Int) {
        let leftArtillaryArray = Array(a[indexStart...indexMiddle])
        let rightArtillaryArray = Array(a[indexMiddle+1...indexEnd])
        
        var index = indexStart
        var indexLeft = 0
        var indexRight = 0
        
        while indexLeft < leftArtillaryArray.count && indexRight < rightArtillaryArray.count {
            if leftArtillaryArray[indexLeft] < rightArtillaryArray[indexRight] {
                a[index] = leftArtillaryArray[indexLeft]
                indexLeft += 1
            }
            else {
                a[index] = rightArtillaryArray[indexRight]
                indexRight += 1
            }
            index += 1
            DispatchQueue.main.async{
                self.arrayView.setNeedsDisplay()
            }
            usleep(delay)
        }
        
        while indexLeft < leftArtillaryArray.count {
            a[index] = leftArtillaryArray[indexLeft]
            index += 1
            indexLeft += 1
            DispatchQueue.main.async{
                self.arrayView.setNeedsDisplay()
            }
            usleep(delay)
        }
        
        while indexRight < rightArtillaryArray.count {
            a[index] = rightArtillaryArray[indexRight]
            index += 1
            indexRight += 1
            DispatchQueue.main.async{
                self.arrayView.setNeedsDisplay()
            }
            usleep(delay)
        }
    }
}
