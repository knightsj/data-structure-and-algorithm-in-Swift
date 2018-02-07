

import Foundation

//swift original sort function
//var arr = [2,1,4,7,3]
//arr.sort()
//print(arr)

//================= Basic functions ================ //


////swap function

func swap(_ arr: inout [Int],  _ j: Int, _ k: Int) {
    
    guard j != k else {
        return;
    }
    
    let temp = arr[j]
    arr[j] = arr[k]
    arr[k] = temp
}


//
//var array = [0,1,2,3,4]
//swap(arr:&array, 1, 2   )
//print(array)



//============= sort functions =============//


//var originalArray = [9,2,3,6,7,20,1,5]
//var originalArray = [4,1,2,3,5,6,7,9,8]
//var originalArray = [3,4,2,5,1]

var inputSize = 500
var originalArray = Array<Int>.randomArray(size: inputSize, maxValue:5)

//var originalArray = Array<Int>.nearlySortedArray(size: inputSize, gap: 10)

//var originalArray = [2,1,3,4,6,5,8,7]
//var originalArray = [2,1,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
//var originalArray = [2,1]


//var originalArray = [9,1,8,5,4,6,2,7,3]
//print("original array    : \(originalArray)\n")
print("original array:\n\(originalArray)\n")

//============= swift sorting =============//

print("\nswift sort...")
var originalArray0 = originalArray
var swiftSortedArray = [Int]()
var time0 = executionTimeInterval{
    originalArray0.sort()
}
print("swift sort time duration : \(time0.formattedTime)")

//============= Simple switch sorting =============//

func switchSort(_ array: inout [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    for i in 0 ..< array.count {
        
        for j in i + 1 ..< array.count {
            //            print("\(i)")
            if array[i] > array[j] {
                //                print("\n change \(a[i]) and \(a[j])")
                array.swapAt(i, j) //keeping the value of index i is the smaller one
                print("\(array)")
            }
        }
    }
    
    return array
    
}



//print("\nswitch sort...")
//var originalArray1 = originalArray
//var switchSortedArray = [Int]()
//var time1 = executionTimeInterval{
//    switchSortedArray = switchSort(&originalArray1)
//}
//
//print("switch sort time duration : \(time1.formattedTime)")
//
//
//

//============= Bubble Sort =============//


func bubbleSort(_ array: inout [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    var compareCount = 0
    
    for i in 0 ..< array.count - 1 {
        //        print("\(i)")
        for j in 0 ..< array.count - 1 - i {
            
            //            count += 1
            compareCount += 1
           
            
            if array[j] > array[j+1] {
                array.swapAt(j, j+1) //keeping index of j is the smaller one
//                print("after swap: \(array)")
                
            }
        }
    }
    print("total compare count： \(compareCount)")
    return array
}

//print("\nbubble sort...")
//var originalArray2 = originalArray
//var bubbleSortedArray = [Int]()
//var time2 = executionTimeInterval{
//    bubbleSortedArray = bubbleSort(&originalArray2)
//}
//
//print("bubble sort time duration : \(time2.formattedTime)")
//




//============= Advanced Bubble Sort =============//

func bubbleSortAdvanced(_ array: inout [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
//    var compareCount = 0
    
    for i in 0 ..< array.count - 1 {
        
        var swapped = false
        for j in 0 ..< array.count - i - 1 {
            
//            compareCount += 1
//            print("No.\(compareCount) compare \(array[j]) and \(array[j+1])")
            
            if array[j] > array [j+1] {
                array.swapAt(j, j+1) //keeping index of j is the smaller one
//                print("after swap: \(array)")
                swapped = true;
                //                count += 1
                //                print("No.\(count) swap \(j) and \(j+1)")
                //                print("\(a)")
            }
        }
        
        //if there is no swapping in inner loop, it means the the part looped is already sorted,
        //so its time to break
        if (swapped == false){ break }
    }
//    print("total compare count： \(compareCount)")
    return array
    
}


//print("\nadvanced bubble sort...")
//var originalArray3 = originalArray
//var advancedBubbleSortedArray = [Int]()
//var time3 = executionTimeInterval{
//    advancedBubbleSortedArray = bubbleSortAdvanced(&originalArray3)
//}



//print("advanced bubble sort sorted elemets: \(advancedBubbleSortedArray.count) time duration : \(time3.formattedTime)")

//============= selection Sort =============//

func selectionSort(_ array: inout [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    //    var count = 0
    var compare = 0
    //move boundary of unsorted subarray
    for i in 0 ..< array.count - 1{
        
        var min = i
        
        // find the minimum element in unsorted array
        for j in i + 1 ..< array.count {
            compare += 1
            
            if array[j] < array[min] {
                min = j //update the minimum value index
            }
        }
        
        //if min has changed, it means there is value smaller than array[min]
        //if min has not changed, it means there is no value smallter than array[min]
        if i != min {
            array.swapAt(i, min) //exchange the minimum value index with current index
            //            count += 1
            //            print("No.\(count) swap \(x) and \(min)")
//            print("after swap: \(array)")
        }
        
        
    }
    
//    print("total compare count： \(compareCount)")
//    print("compare times:\(compare)")
    return array
}

//
//
//print("\nselection sort...")
//var originalArray4 = originalArray
//var selectionSortedArray = [Int]()
//var time4 = executionTimeInterval{
//    selectionSortedArray = selectionSort(&originalArray4)
//}
//
//print("selection sort time duration : \(time4.formattedTime)")
//





//============= insertion Sort =============//

func insertionSort(_ array: inout [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    var compare = 0
    for i in 1..<array.count {
        
        var j = i
        // compare with the previous element,if [y] is smaller, then swap with [y - 1]
        while j > 0 && array[j] < array[j - 1] {
            compare += 1
            
            array.swapAt(j - 1, j)
            
            j -= 1
        }
    }
//    print("compare times:\(compare)")
    return array
}


//print("\ninsertion sort...")
//var originalArray5 = originalArray
//var insertSortedArray = [Int]()
//var time5 = executionTimeInterval{
//    insertSortedArray = insertionSort(&originalArray5)
//}
//
//print("insertion sort time duration : \(time5.formattedTime)")
//

func mergeSort(_ array: [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))             // recursively split left part of original array
    //    print("left array : \(leftArray)")
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))  // recursively split right part of original array
    //    print("right array : \(rightArray)")
    
    return _merge(leftPile: leftArray, rightPile: rightArray)             // merge left part and right part
}


func _merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    
//    print("\nmerge left pile:\(leftPile)  |  right pile:\(rightPile)")
    
    var leftIndex = 0   //left pile index, start from 0
    var rightIndex = 0  //right pile index, start from 0
    
    
    var sortedPile = [Int]() //sorted pile, empty in the first place
    
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        
        //append the smaller value into sortedPile
        if leftPile[leftIndex] < rightPile[rightIndex] {
            
            sortedPile.append(leftPile[leftIndex])
            leftIndex += 1
            
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            
            sortedPile.append(rightPile[rightIndex])
            rightIndex += 1
            
        } else {
            
            //same value, append both of them and move the corresponding index
            sortedPile.append(leftPile[leftIndex])
            leftIndex += 1
            sortedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    
    //left pile is not empty
    while leftIndex < leftPile.count {
        sortedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    //right pile is not empty
    while rightIndex < rightPile.count {
        sortedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
//    print("sorted pile：\(sortedPile)")
    return sortedPile
}

//
//print("\nmerge sort...")
//var originalArray6 = originalArray
//var mergeSortedArray = [Int]()
//var time6 = executionTimeInterval{
//    mergeSortedArray = mergeSort(originalArray6)
//}
//
//print("merge sort time duration : \(time6.formattedTime)")
//

// ============= Quick Sort ============ //

//
//func quickSort0<T: Comparable>(_ array: [T]) -> [T] {
//
//    guard array.count > 1 else { return array }
//
//    let pivot = array[array.count/2]
//    let less = array.filter { $0 < pivot }
//    let equal = array.filter { $0 == pivot }
//    let greater = array.filter { $0 > pivot }
//
//    return quickSort0(less) + equal + quickSort0(greater)
//}

func quickSort0(_ array: [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count/2]
    let less = array.filter { $0 < pivot }
    let greater = array.filter { $0 > pivot }
    
    return quickSort0(less) + quickSort0(greater)
}

print("\nquick sort...")
var originalArray7 = originalArray
var quickSortedArray = [Int]()
var time7 = executionTimeInterval{
    quickSortedArray = quickSort0(originalArray7)
}
quickSortedArray

print("quick sort0 time duration : \(time7.formattedTime)")



func _partition(_ array: inout [Int], low: Int, high: Int) -> Int{
    
    var low       = low
    var high      = high
    
    let pivotValue = array[low]
    
    while low < high {
        
        while low < high && array[high] >= pivotValue {
            high -= 1
        }
        array[low] = array[high]
        
        while low < high && array[low] <= pivotValue {
            low += 1
        }
        array[high] = array[low]
    }
    
    array[low] = pivotValue
    
    return low
}



func quickSort1(_ array: inout [Int], low: Int, high: Int){
    
    guard array.count > 1 else { return }
    
    if low < high {
        
        //pivote index is low
        let pivotIndex = _partition(&array, low: low, high: high)
        
        //pivote index is random
//        let pivotIndex = _partitionRandom(&array, low: low, high: high)
        quickSort1(&array, low: low, high: pivotIndex - 1)
        quickSort1(&array, low: pivotIndex + 1, high: high)
    }
    
}



var originalArray8 = originalArray
var quickSortedArray1 = [Int]()
var time8 = executionTimeInterval{
    quickSort1(&originalArray8, low: 0, high: originalArray8.count-1)
}

print("quick sort1 time duration : \(time8.formattedTime)")



func _partitionRandom(_ array: inout [Int], low: Int, high: Int) -> Int{
    
    
    let x      = UInt32(low)
    let y      = UInt32(high)
    
    let pivotIndex = Int(arc4random() % (y - x)) + Int(x)
    //    print("x \(x) y \(y ) pivotindex \(pivotIndex)")
    let pivotValue = array[pivotIndex]
    
    
    var low = low
    var high = high
    
    while low < high {
        
        while low < high && array[high] >= pivotValue {
            high -= 1
        }
        array[low] = array[high]
        //        print("\nchanged:\(array)")
        
        while low < high && array[low] <= pivotValue {
            low += 1
        }
        
        array[high] = array[low]
        //        print("changed:\(array)")
    }
    
    array[low] = pivotValue
    //    print("changed1:\(array)")
    
    return low
}


func quickSort2(_ array: inout [Int], low: Int, high: Int){
    
    guard array.count > 1 else { return }
    
    if low < high {
        
        //pivote index is random
        let pivotIndex = _partitionRandom(&array, low: low, high: high)
        quickSort2(&array, low: low, high: pivotIndex - 1)
        quickSort2(&array, low: pivotIndex + 1, high: high)
    }
    
}



var originalArray9 = originalArray
var quickSortedArray2 = [Int]()
var time9 = executionTimeInterval{
    quickSort2(&originalArray9, low: 0, high: originalArray9.count - 1)
}
print("quick sort2 time duration : \(time9.formattedTime)")



func quickSort3W(_ array: inout [Int], low: Int, high: Int) {
    
    if high <= low { return }
    
    var lt = low       // arr[low+1...lt] < v
    var gt = high + 1  // arr[gt...high] > v
    var i  = low + 1   // arr[lt+1...i) == v
    
    let pivoteIndex = low
    let pivoteValue = array[pivoteIndex]
    
    while i < gt {
        
        if array[i] < pivoteValue {
          
            swap(&array, i, lt + 1)
            i += 1
            lt += 1
           
        }else if pivoteValue < array[i]{
       
            swap(&array, i, gt - 1)
            gt -= 1
            
        }else {
            i += 1
        }
    }
    
    swap(&array, low, lt)
    quickSort3W(&array, low: low, high: lt - 1)
    quickSort3W(&array, low: gt, high: high)
    
    
}


func quickSort3(_ array: inout [Int] ){
    
    quickSort3W(&array, low: 0, high: array.count - 1)
    
}

var originalArray10 = originalArray
var time10 = executionTimeInterval{
    quickSort3(&originalArray10)
}
print("quick sort3 time duration : \(time10.formattedTime)")




func quicksort4(_ array: [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count/2]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    
    return quicksort4(less) + equal + quicksort4(greater)
}





var originalArray11 = originalArray
var quickSortedArray3 = [Int]()
var time11 = executionTimeInterval{
    quickSortedArray3 = quicksort4(originalArray11)
}

print("quick sort4 time duration : \(time11.formattedTime)")



