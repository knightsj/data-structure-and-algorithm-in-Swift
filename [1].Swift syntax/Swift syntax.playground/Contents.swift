


//  ===============================================================
//                          Swift syntax
//  ===============================================================

// ===================== for loop  ===================== //

// ===================== from small to large

print("============ loop from 1 to 5:")

for index in 1...5 {
    print("index: \(index)")
}
// index : 1
// index : 2
// index : 3
// index : 4
// index : 5


print("============ loop from 1 to 4:")

for index in 1..<5 {
    print("index: \(index)")
}
// index : 1
// index : 2
// index : 3
// index : 4


// ===================== from large to small

print("============ loop from 4 to 1:")
for index in (1..<5).reversed() {
    print("index: \(index)")
}
// index : 4
// index : 3
// index : 2
// index : 1


// ===================== Generics  ===================== //

// ===================== not using generics
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let tmp = a
    a = b
    b = tmp
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let tmp = a
    a = b
    b = tmp
}

// ===================== using generics
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let tmp = a
    a = b
    b = tmp
}

//var a = 1
//var b = 2

var a = 0.22
var b = 0.11

print("\n============ before swapping: a: \(a) b:\(b)")
swapTwoValues(&a, &b)
print("============ after  swapping: a: \(a) b:\(b)")



// ===================== guard syntax  ===================== //


//money:    holding moneny
//price:    product price
//capacity: bag capacity
//volume:   product size

func buying1( money: Int , price: Int , capacity: Int , volume: Int){
    
    if money >= price{
        
        if capacity >= volume{
            
            print("Start buying...")
            print("\(money-price) left after buying.")
            print("\(capacity-volume) capacity left")
            
        }else{
            
            print("No enough capacity")
        }
        
    }else{
        
        print("No enough money")
        
    }
}


func buying2( money: Int , price: Int , capacity: Int , volume: Int){
    
    guard money >= price else{
        print("No enough money")
        return
    }
    
    guard capacity >= volume else{
        print("No enough capacity")
        return
    }
    
    print("\(money-price) money left.")
    print("\(capacity-volume) capacity left")
}

//implementation:
//var result1 = buying1(money: 100, price: 80, capacity: 200, volume: 100)
//var result2 = buying2(money: 100, price: 80, capacity: 200, volume: 100)



// ===================== Function  ===================== //

print("\n============ function")
// =========== no return value
func log(message: String) {
    print("log: \(message)!")
}

log(message: "memory warning")
// output: log: memory warning!


// =========== has return value
func logString(string: String) -> String {
    return "log: " + string
}

let logStr = logString(string: "memory warning!")
print("\(logStr)")
// output: log: memory warning!


// =========== ignore params

func logMessage(_ message: String) {
    print("log: \(message)!")
}
logMessage("memory warning")
// output: log: memory warning!


func addInt(_ a : Int ,_ b : Int){
    print("sum is \(a + b)")
}
addInt(3, 4)
//output : sum is 7


// =========== value or reference passing
var originalArr = [2,1,3]

func removeLastInArray(_ array: inout [Int]){
    array.removeLast()
}
print("\n============ before removing: \(originalArr)")
//[2, 1, 3]
removeLastInArray(&originalArr)
print("============ after   removing: \(originalArr)")
//[2, 1]






// ===================== collection type  ===================== //



// ===================== array

print("\n============ array:")
// immutable array
let immutableNumbers: [Int] = [1, 3, 5, 4, 4, 1]
print("============ immutable array:")
print(immutableNumbers)

// mutable array
var mutableNumbers : [Int] = [2, 1, 5, 4, 1, 3]
print("============ mutable array:")
print(mutableNumbers)

for value in mutableNumbers {
    if let index = mutableNumbers.index(of: value) {
        print("Index of \(value) is \(index)")
    }
}

mutableNumbers.forEach { value in
    if let index = mutableNumbers.index(of: value) {
        print("Index of \(value) is \(index)")
    }
}

for (index, value) in mutableNumbers.enumerated() {
    print("Item \(index + 1): \(value)")
}



mutableNumbers.append(11)
print(mutableNumbers)
// Output: [2, 1, 5, 4, 1, 3, 11]

mutableNumbers.insert(42, at: 4)
print(mutableNumbers)
// Output: [2, 1, 5, 4, 42, 1, 3, 11]

mutableNumbers.swapAt(0, 1)
print(mutableNumbers)
// Output: [1, 2, 5, 4, 42, 1, 3, 11]

mutableNumbers.remove(at: 1)
print(mutableNumbers)
// Output: [1, 5, 4, 42, 1, 3, 11]

mutableNumbers.removeFirst()
print(mutableNumbers)
// Output: [5, 4, 42, 1, 3, 11]

mutableNumbers.removeLast()
print(mutableNumbers)
// Output: [5, 4, 42, 1, 3]


mutableNumbers.removeAll()
print(mutableNumbers)
//[]


// ===================== set

print("\n============ set:")

//value in set is unique
let onesSet: Set = [1, 1, 1, 1]
print(onesSet)
// Output: [1]


let onesArray: Array = [1, 1, 1, 1]
print(onesArray)
// Output: [1, 1, 1, 1]


let numbersSet: Set = [1, 2, 3, 4, 5]
print(numbersSet)
// Output: undefined order, e.g. [5, 2, 3, 1, 4]


// iteration 1
for value in numbersSet {
    print(value)
}
// output is in undefined order


// iteration 2
numbersSet.forEach { value in
    print(value)
}
// output is in undefined order


var mutableStringSet: Set = ["One", "Two", "Three"]
let item = "Two"

//contains
if mutableStringSet.contains(item) {
    print("\(item) found in the set")
} else {
    print("\(item) not found in the set")
}

//isEmpty
let strings = Set<String>()
if strings.isEmpty {
    print("Set is empty")
}

//count
let emptyStrings = Set<String>()
if emptyStrings.count == 0 {
    print("Set has no elements")
}


//insert
mutableStringSet.insert("Four")

//remove 1
mutableStringSet.remove("Three")

//remove 2
if let removedElement = mutableStringSet.remove("Six") {
    print("\(removedElement) was removed from the Set")
} else {
    print("Six is not found in the Set")
}

//removeAll()
mutableStringSet.removeAll()
// []



// ===================== dictionary

print("\n============ dictionary:")



//empty dictionary
var dayOfWeek = Dictionary<Int, String>()
var dayOfWeek2 = [Int: String]()

//not empty dictionary
var dayOfWeek3: [Int: String] = [0: "Sun", 1: "Mon", 2: "Tue"]
print(dayOfWeek3)
//output:[2: "Tue", 0: "Sun", 1: "Mon"]



// acess value
dayOfWeek = [0: "Sun", 1: "Mon", 2: "Tue"]
if let day = dayOfWeek[2] {
    print(day)
}

// iteration 1
for (key, value) in dayOfWeek {
    print("\(key): \(value)")
}

// iteration 2
for key in dayOfWeek.keys {
    print(key)
}

// iteration 3
for value in dayOfWeek.values {
    print(value)
}


// addValue 1
dayOfWeek[3] = "Wed"
print(dayOfWeek)
// Prints: [2: "Tue", 0: "Sun", 1: "Mon", 3: "Wed"]

// updateValue 1
dayOfWeek[2] = "Mardi"
print(dayOfWeek)
// Prints: [2: "Mardi", 0: "Sun", 1: "Mon", 3: "Wed"]

// updateValue 2
dayOfWeek.updateValue("Tue", forKey: 2)
print(dayOfWeek)
// Prints: [2: "Tue", 0: "Sun", 1: "Mon", 3: "Wed"]

// removeValue 1
dayOfWeek[1] = nil
print(dayOfWeek)
// Prints: [2: "Tue", 0: "Sun", 3: "Wed"]

// removeValue 2
dayOfWeek.removeValue(forKey: 2)
print(dayOfWeek)
// Prints: [0: "Sun", 3: "Wed"]

// removeAll
dayOfWeek.removeAll()

print(dayOfWeek)
// Output: [:]



