import UIKit

//Question 1
print("Question 1")
var fromGroceryList : [String] = ["green beans","milk","black beans","pinto beans","apples"]

func typeList ( ArrayGroceryList : [String] ) -> (BeansList : [String] , otherGroc :[String])
{
    var beans = [String]()
    var otherGroc = [String]()
    for grocery in fromGroceryList
    {
        if (grocery.hasSuffix("beans"))
        {
            beans.append(grocery)
        }
        else
        {
            otherGroc.append(grocery)
        }
    }
    return (beans , otherGroc)
}

var  tupple1 = typeList(ArrayGroceryList: fromGroceryList)
print(tupple1.BeansList,"Are the beans")
print(tupple1.otherGroc,"are other groceries")

//Question 2

print("\nQuestion 2")
class Calci
{
    var number1 : Double?
    var number2 : Double?
    
    init(a : Double , b : Double)
    {
        self.number1=a
        self.number2=b
    }
    enum funcCalci
    {
        case adds
        case subs
        case divs
        case muls
        case underoot
    }
    
    func equal(enumf : funcCalci)
    {        switch enumf
        {
            case .adds :
               print(number1! + number2! )
            case .subs:
               print(number1! - number2! )
            case .divs:
        print(number1! / number2! )
    case .muls:
         print(number1! * number2! )
    case .underoot:
        print("Square root of first number is",sqrt( number1! ),"Square root of second number is",sqrt( number2! ))
        }
    }
}


let x = Calci(a : 2 , b : 5)
x.equal(enumf: Calci.funcCalci.adds)
x.equal(enumf: Calci.funcCalci.underoot)

//Structure
print("\nUsing Structure : ")
struct Calcii
{
    func addition(_ num1 : Int ,_ num2 : Int) -> Int
    {
        return (num1 + num2)
    }
    func substration(num1 : Int , num2 : Int) -> Int
    {
        return (num1 - num2)
    }
    func multiplication(num1 : Int , num2 : Int) -> Int
    {
        return (num1 * num2)
    }
}

func clci1(c : (Int,Int) -> Int , firstNum : Int , secondNum : Int)
{
   let m = c(firstNum , secondNum)
    print(m)
}
var n = Calcii()
clci1(c : n.addition , firstNum: 1 , secondNum: 12 )
clci1(c: n.multiplication , firstNum: 12, secondNum: 10 )
