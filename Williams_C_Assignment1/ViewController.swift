//
//  ViewController.swift
//  Williams_C_Assignment1
//
//  Created by CWILL on 4/16/18.
//  Copyright © 2018 DePaul. All rights reserved.
//

import UIKit
var N = 16

var shuffleOn = true;
var shuffles = 0
var arraySegmentSelected = 0

var shuffleOn2 = true;
var shuffles2 = 0
var arraySegmentSelected2 = 0

let delay:UInt32 = 100_000
let quick_sort_delay:UInt32 = 10_000

var taskComplete = true;
var taskComplete2 = true;
var tmpStorage = [Int]();
class ViewController: UIViewController {

    @IBOutlet weak var sortSegmentedControl: UISegmentedControl!
    @IBOutlet weak var sortSegmentedControl2: UISegmentedControl!
    @IBOutlet weak var arraySizeOutlet: UISegmentedControl!
    @IBOutlet weak var arraySizeOutlet2: UISegmentedControl!
    
    @IBOutlet weak var arrayView: ArrayView!
    @IBOutlet weak var arrayView2: ArrayView!
    
 
    @IBAction func segmentArraySizeAction(_ sender: UISegmentedControl) {
        
        
        arraySegmentSelected = sender.selectedSegmentIndex
        switch(arraySegmentSelected){
            case 0: N = 16;preshuffle(arrayView);break;
            case 1: N = 32;preshuffle(arrayView);break;
            case 2: N = 48;preshuffle(arrayView);break;
            case 3: N = 64;preshuffle(arrayView);break;
            default: break;
        }
    }
    
    @IBAction func segmentArraySizeAction2(_ sender: UISegmentedControl) {
        
        arraySegmentSelected2 = sender.selectedSegmentIndex
        switch(arraySegmentSelected2){
        case 0: N = 16;preshuffle(arrayView2);break;
        case 1: N = 32;preshuffle(arrayView2);break;
        case 2: N = 48;preshuffle(arrayView2);break;
        case 3: N = 64;preshuffle(arrayView2);break;
        default: break;
        }
    }
    @IBAction func sortSegmentedControlPressed(_ sender: UISegmentedControl) {
        //add code
        if(checkIfRandomized(&arrayView.data)){
            switch(sender.selectedSegmentIndex){
            case 0:insertion(arrayView);print("0 pressed by Chris. Insertion Sort started. sortSegmentedControlPressed");break;
            case 1:selection(arrayView);print("1 pressed by Chris. Selection Sort started. sortSegmentedControlPressed");break;
            case 2:quick(arrayView);print("2 pressed by Chris. Quick Sort started. sortSegmentedControlPressed");break;
            case 3:merge(arrayView);print("3 pressed by Chris. Merge Sort started. sortSegmentedControlPressed");break;
            default:drawShapes(arrayView);break;
            }
        }
        
    }
    
    @IBAction func sortSegmentedControlPressed2(_ sender: UISegmentedControl) {
        if(checkIfRandomized(&arrayView2.data)){
            switch(sender.selectedSegmentIndex){
                case 0:insertion(arrayView2);print("0 pressed by Chris. Insertion Sort started. sortSegmentedControlPressed2");break;
                case 1:selection(arrayView2);print("1 pressed by Chris. Selection Sort started. sortSegmentedControlPressed2");break;
                case 2:quick(arrayView2);print("2 pressed by Chris. Quick Sort started. sortSegmentedControlPressed2");break;
                case 3:merge(arrayView2);print("3 pressed by Chris. Merge Sort started. sortSegmentedControlPressed2");break;
                default:drawShapes(arrayView2);break;
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
      recalibrate(arrayView)
      recalibrate(arrayView2)
    }
    func preshuffle(_ a:ArrayView){
        eraseArrayData(a)
        //repopulate array
        for i in 0..<N{
            let r = Int(arc4random_uniform(UInt32(i + 1)))
            a.data.append(r)
        }
        //upadate with randomly populated array
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async{
            DispatchQueue.main.async{
                a.setNeedsDisplay()
            }
        }
 
        
    }
    func eraseArrayData(_ a:ArrayView){
        a.data.removeAll()
    }
    func recalibrate(_ a:ArrayView){
        eraseArrayData(a)
        for i in 0..<N{
            let r = Int(arc4random_uniform(UInt32(i + 1)))
            a.data.append(r)
            //arrayView.data.append(i)
        }
        
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async{
            self.shuffle(&a.data,a)
            //DispatchQueue.main.async{
                //self.arrayView.setNeedsDisplay()
            //}
        }
    }
    
    func drawShapes(_ a:ArrayView){
        eraseArrayData(a)
        for i in 0..<N{
            a.data.append(i + 1)
        }
        
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async{
            DispatchQueue.main.async{
                a.setNeedsDisplay()
            }
        }
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
 
    func shuffle(_ a: inout[Int], _ aa:ArrayView){
        shuffles += 1
        shuffles2 += 1
        let N = a.count
        if(!shuffleOn && (shuffles > 0 || shuffles2 > 0)){
            shuffleOn = true;
            shuffleOn2 = true;
            for i in 0 ..< N{
                let r = Int(arc4random_uniform(UInt32(i + 1)))
                a.swapAt(i,r)
                DispatchQueue.main.async{
                    aa.setNeedsDisplay()
                }
                usleep(delay)
            }
        }
        shuffleOn = false;
        shuffleOn2 = false;
        
    }
    
    func insertion(_ a:ArrayView){
  
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async{
           
        
            let insertion = insertionSort(a)
            insertion.populateWithData(a.data)
            insertion.Sort(&a.data)

        }
    }
    func selection(_ a:ArrayView){

        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async{
            let selection = selectionSort(a)
            selection.populateWithData(a.data)
            selection.Sort(&a.data)
 
        }
    }
    
    func merge(_ a:ArrayView){
      
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async{
             let _merge = mergeSort(a)
            _merge.populateWithData(a.data)
            _merge.mergeSort(array: &a.data)
          
        }
    }
    
    func quick(_ a:ArrayView){
        
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async{
            let _quick = quickSort(a)
            _quick.populateWithData(a.data)
            _quick.quicksort(&a.data)
           
        }
        
    }
    func checkIfRandomized(_ a: inout[Int]) -> Bool{
        tmpStorage = a;
        for i in stride(from:1, to:a.count - 1, by:1){
            let j = i + 1
            //check if previous element is greater than next element
            if(a[i] > a[j]){
                //check tmp storage is still the same as the passed in storage
                if(tmpStorage[i] == a[i]){
                    return true;
                }
            }
        }
        return false;
        //check if the array is the same
    }
    
    
}

