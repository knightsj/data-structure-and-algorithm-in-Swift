#  Algorithm



Simple algorithm implementation.



## Sum operation

```swift
// O(n)
func sumOpration1(_ n:Int) -> Int{
    
    var sum = 0
    
    for i in 1 ... n {
        sum += i
    }
    
    return sum
}
sumOpration1(100)//5050


// O(1)
func sumOpration2(_ n:Int) -> Int{
    
    return (1 + n) * n/2
}

```



## Two Sum

```swift
//O(n^2)
func findTwoSum(_ array: [Int], target: Int) -> (Int, Int)? {
    
    guard array.count > 1 else {
        return nil
    }
    
    for i in 0..<array.count {
        
        let left = array[i]
        
        for j in (i + 1)..<array.count {
            let right = array[j]
            if left + right == target {
                return (i, j)
            }
        }
    }
    return nil
}


//O(n) 
func findTwoSumOptimized(_ array: [Int], target: Int) -> (Int, Int)? {
    
    guard array.count > 1 else {
        return nil
    }
    
    var diffs = Dictionary<Int, Int>()
    
    for i in 0..<array.count {
        let left = array[i]
        
        let right = target - left
        
        if let foundIndex = diffs[right] {
            return (i, foundIndex)
        } else {
            diffs[left] = i
        }
    }
    
    return nil
}
```



## Recursion



#### Example 1

```swift
//good recursion
func factorial(_ n:Int) -> Int{
    return n < 2 ? 1: n * factorial(n-1)
}


// bad  recursion - > stack overflow
func factorialInfinite(_ n:Int) -> Int{
    return n * factorialInfinite(n-1)
}
```



#### Example 2

```swift
// bad  recursion - > stack overflow
func sumOperation( _ n:Int) -> Int {
    if n == 0 {
        return 0
    }
    return n + sumOperation(n - 1)
}

sumOperation(2) //0
//sumOperation(-1) //stack overflow



// good recursion
func sumOperation1( _ n:Int) -> Int {
    if n <= 0 {
        return 0
    }
    return n + sumOperation1(n - 1)
}
```

