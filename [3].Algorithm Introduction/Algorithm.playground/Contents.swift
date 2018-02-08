

// ===============  sum ===============

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



sumOpration2(100)//5050


//O(n ^ 2)
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

let array = [0,2,1,3,6]
if let indexes = findTwoSum(array, target: 8) {
    print(indexes)
} else {
    print("No pairs are found")
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



// ===============  recursion ===============
//good recursion
func factorial(_ n:Int) -> Int{
    return n < 2 ? 1: n * factorial(n-1)
}

factorial(3) //6
factorial(4) //24


// bad  recursion - > stack overflow
func factorialInfinite(_ n:Int) -> Int{
    return n * factorialInfinite(n-1)
}

//factorialInfinite(3)

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

sumOperation1(-1) //0

