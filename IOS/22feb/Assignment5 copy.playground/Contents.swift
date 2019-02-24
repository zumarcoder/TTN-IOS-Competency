import UIKit

//Question 1
// Swift Extension is a useful feature that helps in adding more functionality to an existing Class, Structure, Enumeration or a Protocol type. This includes adding functionalities for types where you don’t have the original source code too (extensions for Int, Bool, String etc. types).


//class textDel
//{
//
//}
//
//extension textDel
//{
//    var TextViewDel : UITextView
//    {
//        return UITextView
//    }
//}
//
//var checktextDel = textDel()

// Ques 3 :

protocol sayhelloAkash
{
    func sayHello()
}
extension sayHey : sayhelloAkash
{
    func sayHello() {
        print("Hello!")
    }
}
class sayHey
{
    var name : String
    init(name1 : String) {
        self.name = name1
    }
}

var sh = sayHey(name1 : "Akash")
sh.sayHello()

print("//----------------------------------------------------------------------------------------//")
// Ques 4 :

enum Meals: String {
    case breakfast
    case lunch
    case brunch
    case Dinner
}

extension Meals {
    var value: String {
        return self.rawValue
    }
    
    func printValue() {
        switch self {
        case .breakfast:
            print("Bread Butter Milk")
        case .lunch:
            print("Omlet and Juice")
        case .brunch:
            print("Protein shake and PeaNut Butter")
        case .Dinner:
            print("Chapati and Daal")
        }
    }
}

Meals.breakfast.printValue()
print("//----------------------------------------------------------------------------------------//")
//ques 5
//What is Generic
//Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner.

//ques 6
func swapInt1 (_ num1 : inout Int ,_ num2 : inout Int)
{
    let temporary = num1
    num1 = num2
    num2 = temporary
}
func swapDouble1 (num1 : inout Double , num2 : inout Double)
{
    let temporary = num1
    num1 = num2
    num2 = temporary
}

//non - generic

var firstnumint : Int = 12
var secondnumint : Int = 10
swapInt1( &firstnumint ,  &secondnumint)

var firstnumDoub : Double = 12.60
var secondnumDoub : Double = 8.40
swapDouble1(num1: &firstnumDoub, num2: &secondnumDoub)


// generic
func swappingAllType <A>(_ num1 : inout A , _ num2 : inout A )
{
    let Temporary = num1
    num1 = num2
    num2 = Temporary
}
var int11 = 12
var int22 = 11
swappingAllType(&int11, &int22)

var strng1 = "Akash"
var strng2 = "Anubhav"
swappingAllType(&strng1, &strng2)

//by using generic key word we dont need to declare the numerous function according to the


//ques 7
/*:
 Map : Map is a high order function which Returns an array containing the results of mapping the given closure over the sequence’s elements.
 CompactMap : CompactMap is a high order function which Returns an array containing the non-nil results of calling the given transformation with each element of this sequence.
 */
//example
let mixedUpArray : [Int?] = [1,21,33,nil,41,nil,36]
let Maparray = mixedUpArray.map{$0}
print(Maparray)
let MapCompactArray = mixedUpArray.compactMap{$0}
print(MapCompactArray)
print("//----------------------------------------------------------------------------------------//")
// Ques 8

var maxNumber = Array(1...5)
    .reduce(1000) { (total, number) in (total + number) }
print(maxNumber)
print("//----------------------------------------------------------------------------------------//")
// Ques 9

struct Person {
    
    
    
    var name : String
    
    var age : Int
    
    
    
}

let person1 = Person(name: "Sam", age: 23)

let person2 = Person(name: "John", age: 30)

let person3 = Person(name: "Rob", age: 27)

let person4 = Person(name: "Luke", age: 20)



let personArray = [person1, person2, person3, person4]

var moreThentf = personArray.filter{$0.age > 25}
for emp1 in moreThentf
{
    print(emp1.name," is older then 25")
}
print("//----------------------------------------------------------------------------------------//")
