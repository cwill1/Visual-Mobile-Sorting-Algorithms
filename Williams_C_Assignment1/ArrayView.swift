//
//  ArrayView.swift
//  Williams_C_Assignment1
//
//  Created by CWILL on 4/16/18.
//  Copyright © 2018 DePaul. All rights reserved.
//

import Foundation
import UIKit
class ArrayView: UIView {
    @IBInspectable var color: UIColor = UIColor.red

    var data = [Int]()
  
    override func draw(_ rect: CGRect){
        //Drawing code
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        if data.count > 0 {
            let gap = 2;
            let w = Int(bounds.width)/data.count - gap;
            let h = Int(bounds.height)/data.count
            context.setFillColor(color.cgColor)
            
            for i in 0 ..< data.count{
                context.fill(CGRect(x:i*(w + gap), y: Int(bounds.height), width:w, height:-data[i] * h))
            }
        }
    }
    
}
