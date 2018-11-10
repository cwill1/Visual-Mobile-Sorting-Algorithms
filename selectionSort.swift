//
//  selectionSort.swift
//  Williams_C_Assignment1
//
//  Created by CWILL on 4/18/18.
//  Copyright © 2018 DePaul. All rights reserved.
//

import Foundation

class selectionSort{
    
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
    func Sort(_ a: inout[Int]){
        let n = a.count
        for i in stride(from:0, to: n - 1, by: 1){
            var minimum_index = i;
            for j in stride(from:i + 1, to: n , by: 1){
                if (a[j] < a[minimum_index]){
                    minimum_index = j;
                }
            }
            let myTmp = a[minimum_index];
            a[minimum_index] = a[i];
            a[i] = myTmp;
            DispatchQueue.main.async{
                self.arrayView.setNeedsDisplay()
            }
            usleep(delay)
            
        }
            
        
    }
}
