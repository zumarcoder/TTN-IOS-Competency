import UIKit

/* :
 ------------------------------------Question1--------------------------------
 Difference between Self and self
 
 When you’re writing protocols and protocol extensions, there’s a difference between Self (capital S) and self (lowercase S). When used with a capital S, Self refers to the type that conform to the protocol, e.g. String or Int. When used with a lowercase S, self refers to the value inside that type, e.g. “hello” or 556.
 */




// -----------------------------Question2------------------------------------
//As this is not a generic function generic function is below this code
protocol addable {
    
    func addition(lhs : String, rhs : String) -> String
    func addition(lhs : Int, rhs : Int) -> Int
     func addition(lhs : Double, rhs : Double) -> Double
    
}

class AddableCheck
{
    
}

extension AddableCheck : addable
{
    func addition(lhs: String, rhs: String) -> String {
        return lhs + rhs
    }
    
    func addition(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func addition(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
}


let addObj = AddableCheck()

let stringSum = addObj.addition(lhs: "Hello", rhs: "World")
let doubleSum = addObj.addition(lhs: 3.2, rhs: 3.8)
print(stringSum) // prints string
print(doubleSum) // prints sum of double

// With the Help of generic Method

protocol Addable {
static func +(lhs: Self, rhs: Self) -> Self
}

func add<T: Addable>(_ num1: T, _ num2: T) -> T {
    return num1 + num2
}

extension Int: Addable {}
extension Double: Addable {}
extension Float: Addable {}
extension String : Addable {}

print(add("Akash", "Verma"))
print(add(13.0 , 12.8))



// ------------------------Question 3------------------------------------


protocol combining
{
     func combined() -> String
}

extension Array : combining
{
     func combined() -> String {
         // further operation to be done to add all the elements of the array in one variable and that variable will be returned back
    return "hello"
    }
}

var checkarray = ["hello", "i", "Am"]
var abc = checkarray.combined()

