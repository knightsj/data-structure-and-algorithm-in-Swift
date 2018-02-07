#  Sort algorithms



Swift code implementation of bubble sort, selection sort, insertion sort, merge sort and quick sort.



## Bubble Sort

```swift
func bubbleSort(_ array: inout [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    for i in 0 ..< array.count - 1 {
        
        for j in 0 ..< array.count - 1 - i {
            
            if array[j] > array[j+1] {
                array.swapAt(j, j+1) //keeping index of j is the smaller one
                
            }
        }
    }
    return array
}
```



## Advanced Bubble Sort

```swift
func bubbleSortAdvanced(_ array: inout [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }

    for i in 0 ..< array.count - 1 {
        
        var swapped = false
        for j in 0 ..< array.count - i - 1 {
            
            if array[j] > array [j+1] {
                array.swapAt(j, j+1) //keeping index of j is the smaller one
                swapped = true;
            }
        }
        
        //if there is no swapping in inner loop, it means the the part looped is already sorted,
        //so its time to break
        if (swapped == false){ break }
    }
    return array
    
}
```





## Selection Sort

```swift
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
        }
        
        
    }
    return array
}
```





## Insertion Sort

```swift
func insertionSort(_ array: inout [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }

    for i in 1..<array.count {
        
        var j = i
        // compare with the previous element,if [y] is smaller, then swap with [y - 1]
        while j > 0 && array[j] < array[j - 1] {
            array.swapAt(j - 1, j)
            j -= 1
        }
    }
    return array
}
```





## Merge sort

```swift
func mergeSort(_ array: [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))             // recursively split left part of original array

    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))  // recursively split right part of original array
  
    
    return _merge(leftPile: leftArray, rightPile: rightArray)             // merge left part and right part
}


func _merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    
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
```



## Quick Sort



#### Quick sort with swift filter function

option1:

```swift
func quickSort0(_ array: [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count/2]
    let less = array.filter { $0 < pivot }
    let greater = array.filter { $0 > pivot }
    
    return quickSort0(less) + quickSort0(greater)
}
```



option2:

```swift
func quicksort(_ array: [Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count/2]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    
    return quicksort(less) + equal + quicksort(greater)
}

```





#### Fixed index of pivot

```swift
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
    
        quickSort1(&array, low: low, high: pivotIndex - 1)
        quickSort1(&array, low: pivotIndex + 1, high: high)
    }
    
}
```



#### Random index of pivot

```swift
func _partitionRandom(_ array: inout [Int], low: Int, high: Int) -> Int{
    
    
    let x      = UInt32(low)
    let y      = UInt32(high)
    
    let pivotIndex = Int(arc4random() % (y - x)) + Int(x)
    let pivotValue = array[pivotIndex]
    
    
    var low = low
    var high = high
    
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


func quickSort2(_ array: inout [Int], low: Int, high: Int){
    
    guard array.count > 1 else { return }
    
    if low < high {
        
        //pivote index is random
        let pivotIndex = _partitionRandom(&array, low: low, high: high)
        quickSort2(&array, low: low, high: pivotIndex - 1)
        quickSort2(&array, low: pivotIndex + 1, high: high)
    }
    
}
```





#### 3-way quick sort 

```swift
//only for swapping two elements in array
func swap(_ arr: inout [Int],  _ j: Int, _ k: Int) {
    
    guard j != k else {
        return;
    }
    
    let temp = arr[j]
    arr[j] = arr[k]
    arr[k] = temp
}


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
```



