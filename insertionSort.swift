//
//  insertionSort.swift
//  Williams_C_Assignment1
//
//  Created by CWILL on 4/17/18.
//  Copyright © 2018 DePaul. All rights reserved.
//

import Foundation

class insertionSort{
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
            for num in stride(from:1, to:n, by:1){
                    let myKey = a[num];
                    var j = num - 1;
                
                    //queue.async{
                    while (j >= 0 && a[j] > myKey){
                        a[j+1] = a[j];
                        //add visual swap here
                        a.swapAt(j + 1, j)
                        DispatchQueue.main.async{
                            self.arrayView.setNeedsDisplay()
                        }
                        usleep(delay)
                        j = j - 1;
                    }
                    self.arraySize[j + 1] = myKey;
        }
    }
    
}
