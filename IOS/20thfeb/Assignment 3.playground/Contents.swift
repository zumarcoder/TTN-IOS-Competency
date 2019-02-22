import UIKit

// ques 1 : Implement the parameterised initialisation with class or struct.
struct Employee
{
    var name : String?
    var id : Int?
    var ph_no : Int?
    init(name: String , id : Int , ph_no : Int)
    {
        self.name=name
        self.id=id
        self.ph_no=ph_no
    }
}
let obj = Employee(name: "Akash" , id: 3308 , ph_no: 9999598474 )
print("NAME IS : ",obj.name! , " ID IS : ",obj.id! ," AND PHONE NUMBER IS : ",obj.ph_no! )

//question 2 : Write all the Rules of initialiser in Inheritance
/*:
 ## A designated initializer must call a designated initializer from its immediate superclass.
 ## Rule 2: A convenience initializer must call another initializer from the sameclass.
 ## Rule 3: A convenience initializer must ultimately call a designated initializer
 */
//ques 3 :  Using convenience Initializers, write-down the Initializers for MOVIE class having basic attributes like title, author, publish_date, etc.
print("------------------------------------------------------------------")
class movie
{
    var title : String?
    var author : String?
    var publish_date : String?
    init(title1 : String , author1 : String , pubdate1 : String)
    {
        self.title = title1
        self.author = author1
        self.publish_date = pubdate1
    }
    convenience init( title1 : String)
    {
        self.init(title1 : title1 , author1 : "Karan" , pubdate1 : "16 Sept")
    }
    
}

// calling convinince initializer
var movieRamayan = movie(title1 : "ramayan")
print(movieRamayan.author!)
print(movieRamayan.title!)
print(movieRamayan.publish_date!)

print(" \n ")
//calling designated Initialiser
var movieAvatar = movie(title1 : "avatar" , author1 : "jack" , pubdate1 : "25 sept")
print(movieAvatar.author!)
print(movieAvatar.title!)
print(movieAvatar.publish_date!)
print("------------------------------------------------------------------")


// ques4-Declare a structure which can demonstrate the throwable Initializer
enum ValidationError: Error
{
    case invalid
}
struct User
{
    let name: String
    
    init(name: String?) throws
    {
        
        guard let name = name
            else
        {
            throw ValidationError.invalid
        }
        self.name=name
    }
}


do {
    let user = try User(name:nil)
    print("success")
    // success
} catch {
    print("Error :\(error)")
}
print("------------------------------------------------------------------")
print("\n")

// Array
// ques1-Create an array containing the 5 different integer values. Write are at least 4 ways to do this.
// Type 1
var arraya: Array<Int> = []

// Type 2
var arrayb: [Int] = []

// Type 3
var arrayc = Array<Int>()

// Type 4
var arrayd = [Int]()


// Ques2-Create an immutable array containing 5 city names.
let city : [String]=["Delhi","Ghaziabad","Hapur","Meerut","Muzaffarnagar"]
print("Array is : \(city)")
print("------------------------------------------------------------------")


// Ques3-Create an array with city 5 city names. Later add other names like Canada, Switzerland, Spain to the end of the array in at least 2 possible ways.
var cityAdd : [String]=["Delhi","Ghaziabad","Hapur","Meerut","Muzaffarnagar"]
print("Before add on \(cityAdd)")
cityAdd.append("Canada")
cityAdd.append("Switzerland")
print("After add on \(cityAdd)")
cityAdd += ["Lucknow","Kanpur"]
print("Second way to insert in array \(cityAdd)")
print("------------------------------------------------------------------")
// ques4-Create an array with values 14, 18, 15, 16, 23, 52, 95. Replace the values 24 & 48 at 2nd & 4th index of array
var intArray : [Int]=[14, 18, 15, 16, 23, 52, 95]
intArray.insert(24, at: 2)
intArray.insert(48, at: 4)
print("array after replacing at 2 and 4 index \(intArray)")
print("------------------------------------------------------------------")

// Set
// ques1-Determine whether the set of house animals is a subset of farm animals.
let houseAnimals: Set = ["🐶","🐱"]
let farmAnimals: Set = ["🐮", "🐓", "🐏", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

if houseAnimals.isSubset(of: farmAnimals){
    print("house Animal is subset of farm Animal")
}
else{
    print("house Animal is not subset of farm Animal")
}
print("-------------------------------------------------")
// ques2-Determine whether the set of farm animals is a superset of house animals.
if farmAnimals.isSuperset(of: houseAnimals){
    print("farm Animals is superset of houseAnimals")
}
else{
    print("farm Animals is not superset of houseAnimals")
}
print("-------------------------------------------------")
//  ques3-Determine if the set of farm animals is disjoint with city animals.
if farmAnimals.isDisjoint(with: cityAnimals){
    print("farm Animals is  of houseAnimals")
}
else{
    print("farm Animals is not superset of houseAnimals")
}
print("-------------------------------------------------")
// ques4-Create a set that only contains farm animals that are not also house animals.
let removeAnimal:Set=farmAnimals.subtracting(houseAnimals)
print(removeAnimal)
print("-------------------------------------------------")
// ques5-Create a set that contains all the animals from all sets.
let allAnimal:Set=farmAnimals.union(cityAnimals)
print(allAnimal)
print("-------------------------------------------------")

// Dictionary
// ques 1-Create an empty dictionary with keys of type String and values of type Int and assign it to a variable in as many ways as you can think of (there's at least 4 ways).
let myDictionary1: Dictionary<String, Int> = [:]
let myDictionary2: [String: Int] = [:]
let myDictionary3 = Dictionary<String, Int>()
let myDictionary4 = [String: Int]()
print("-------------------------------------------------")
// ques2-Create a mutable dictionary named secretIdentities where the key value pairs are "Hulk" -> "Bruce Banner", "Batman" -> "Bruce Wayne", and "Superman" -> "Clark Kent".
var secretIdentities: [String:String] = ["Hulk":"Bruce Banner","Batman":"Bruce Wayne","Superman":"Clark Kent"]
print(secretIdentities)
print("-------------------------------------------------")
// ques3-Create a nesters structure of Key-value pair.
var nestedDictionary: [Int:[Int:String]]=[1:[1:"Akash",2:"aditya"],2:[1:"anubhav",2:"shivam"]]
print(nestedDictionary)
print("-------------------------------------------------")
// ques4-Print all the keys in the dic
print(nestedDictionary.keys)
print("-------------------------------------------------")
// Subscript :
// ques1-What is subscript ? Write down the declaration syntax.
//Accessing the element members of a collection, sequence and a list in Classes, Structures and Enumerations are carried out with the help of subscripts. These subscripts are used to store and retrieve the values with the help of index.
//Declaration
class Subscript{
    subscript (index:Int )-> Int {
        // the getter is required
        get {
            // used for subscript value declarations
            return 0
        }
        set(newValue) { // the setter is optional
            // definitions are written here
        }
    }
}
print("-------------------------------------------------")
// ques2-Create a simple subscript that outputs true if a string contains a substring and false otherwise.
class daysofaweek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                        "Thursday", "Friday", "saturday"]
    subscript(index: Int) -> Bool {
        get {
            if days[index].contains("Sunday"){
                return true
            }
            else{
                return false
            }
        }
    }
}
var p = daysofaweek()
print(p[0])

print("-------------------------------------------------")
print("-------------------------------------------------")
