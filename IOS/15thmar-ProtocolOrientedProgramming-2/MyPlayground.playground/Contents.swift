import UIKit

/* :
 ------------------------------------Question1--------------------------------
 Difference between Self and self
 
 When you’re writing protocols and protocol extensions, there’s a difference between Self (capital S) and self (lowercase S). When used with a capital S, Self refers to the type that conform to the protocol, e.g. String or Int. When used with a lowercase S, self refers to the value inside that type, e.g. “hello” or 556.
 */




// -----------------------------Question2------------------------------------
//As this is not a generic function generic function is below this code
protocol Addable {
    
    func addition(lhs : String, rhs : String) -> String
    func addition(lhs : Int, rhs : Int) -> Int
     func addition(lhs : Double, rhs : Double) -> Double
    
}

class AddableCheck : Addable
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

protocol Addable1 {
static func +(lhs: Self, rhs: Self) -> Self
}

func add<T: Addable1>(_ num1: T, _ num2: T) -> T {
    return num1 + num2
}

extension Int: Addable1 {}
extension Double: Addable1 {}
extension Float: Addable1 {}
extension String : Addable1 {}
extension Array : Addable1 {}

print(add("Akash", "Verma"))
print(add(13.0 , 12.8))



// ------------------------Question 3------------------------------------


protocol combining
{
     func combined() -> Any
}




extension Array : combining
{
    
    
    func combined() -> Any {
        
        if(self is [Int])
        {
            var temp : Int = 0
            for count1 in self
            {
                temp = add(temp, count1 as! Int)
            }
            if(temp == 0)
            {
                return "Empty Array"
            }
            else{
            return temp
            }
        }

        else if (self is [String])
        {
            var temp : String = ""
            for count1 in self
            {
                temp = add(temp, count1 as! String)
            }
            if(temp == nil)
            {
                return "Empty Array"
            }
            else
            {
              return temp
            }
        }
        
            return "Empty Array"
}
}
var intTypeArray = [1,2,3]
var firstInt = intTypeArray.combined()
var stringTypeArray = [ "hello" , "i" , "Am" , "Akash" ]
var secondString = stringTypeArray.combined()
var emptyArray = [Int]()
var printEmptyArray = emptyArray.combined()
print(firstInt)
print(secondString)
print(printEmptyArray)

