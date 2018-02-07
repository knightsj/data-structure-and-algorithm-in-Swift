import Foundation

extension Array {
    
    static public func randomArray(size: Int, maxValue: UInt) -> [Int] {
        var result = [Int](repeating: 0, count:size)
        
        for i in 0 ..< size {
            result[i] = Int(arc4random_uniform(UInt32(maxValue)))
        }
        
        return result
    }
    
    static public func incrementalArray(size: Int) -> [Int] {
        var result = [Int](repeating: 0, count:size)
        
        for i in 0 ..< size {
            result[i] = i
        }
        
        return result
    }
    
    
    static public func nearlySortedArray(size: Int, gap:Int) -> [Int] {
        
        var result = [Int](repeating: 0, count:size)
        
        for i in 0 ..< size {
            result[i] = i
        }
        
        let count : Int = size / gap
        var arr = [Int]()
        
        for i in 0 ..< count {
            arr.append(i*gap)
        }
        
        for j in 0 ..< arr.count {
            let swapIndex = arr[j]
            result.swapAt(swapIndex,swapIndex+1)
        }

        return result
    }
    
    
    static public func reverseOrderedArray(size: Int) -> [Int] {
        var result = [Int](repeating: 0, count:size)
        
        for i in 0 ..< size {
            result[i] = size - i
        }
        
        return result
    }
}
