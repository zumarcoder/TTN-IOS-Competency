import UIKit

//Question 1

/*:
 Swift requires you to create a custom Error type. Typically an Enum is used which conforms to the Error Protocol.
 */

enum errorPro : Error
{
    case initilasiedFalse
}

func checkerror(throwErrorBool : Bool) throws -> String
{
     if throwErrorBool
     {
        return "Successfull"
     }
        else
    {
        throw errorPro.initilasiedFalse
    }
    
}
do {
 try checkerror(throwErrorBool: false)
}
catch{
    print(error)
}

// Question 2

enum Ques2 : Error
{
    case initilisationFailed
}
class InitErrorCheck
{
    var numberInt : Int?
    init? (not0 : Int)
    {
        if not0 == 0
        {
            return nil
        }
        else
        {
            self.numberInt = not0
        }
    }
}

var obj = InitErrorCheck(not0: 12)
do{
    if (obj == nil)
    {
        throw Ques2.initilisationFailed
    }
else
    {
        print(obj!.numberInt!)
    }
}
catch{

        print( Ques2.initilisationFailed )
    
}

 //Question 3

/*:
 try is use to try for the error in the following code
 try! is used when the user is sure that the following code will surely not throw the error, but if the error thrown then the playground will crash. This can be used without do catch block.
 try? is used when the user is not sure that it may or may not throw the error ,  This can be used without do catch block.
 */


enum checkadd : Error
{
    case lessThenTwenty(String)
}
func checkForVal(num1 : Int) throws -> Int
{
    if(num1 > 20 )
    {
       return num1
    }
    else{
        throw checkadd.lessThenTwenty("Values is smaller then 20")
    }
}
do{
   let obj1 = try checkForVal(num1: 10)
    print(obj1)
}
catch
{
    print(error)
}

// as the try! means that this will throw the error for sure
let obj2 = try! checkForVal(num1: 102) // if value changed to 10 it will crash
print(obj2)

// as the try? means that it may or may not throw the error
let obj3 = try? checkForVal(num1: 10) // if value changed to 10 also then it will show the error
print(obj3)

// Question 4

struct toTheNew
{
    var empID : Int
    var empName : String
    var empEmail : String
    var joiningDate : Int
    var isPresent : Bool
    var competency : String
    var attendancePercent : Int
}
enum noBonusReasons : Error
{
    case EmployeenotPresent(String)
    case Competency(String)
    case notCompletedoneYear(String)
    case notaemployee(String)
    case attendanceLessThenEighty(String)
}
class BonusProgram {
    
    var TTNEmployees : [toTheNew] = [toTheNew(empID: 101, empName: "Muskan", empEmail: "muskaan@tothenew.com",                       joiningDate: 2018 , isPresent: false, competency: "ios" , attendancePercent: 89) ,
        toTheNew(empID: 102, empName: "Mithesh", empEmail: "mithlesh@tothenew.com", joiningDate: 2017 , isPresent: true, competency: "Bussiness intelligence" , attendancePercent: 89) ,
        toTheNew(empID: 103, empName: "Ankit", empEmail: "ankitnigam@tothenew.com", joiningDate: 2018 , isPresent: true, competency: "ios" , attendancePercent: 90) ,
        toTheNew(empID: 104, empName: "Sachin", empEmail: "sachin@tothenew.com", joiningDate: 2019 , isPresent: true, competency: "ios" , attendancePercent: 81) ,
        toTheNew(empID: 101, empName: "Muskan", empEmail: "muskaan@tothenew.com", joiningDate: 2018 , isPresent: false, competency: "ios" , attendancePercent: 89) ,
        toTheNew(empID: 105, empName: "Merry", empEmail: "merry@tothenew.com", joiningDate: 2015 , isPresent: true, competency: "ios" , attendancePercent: 95)]
    func allowedForBonus (Email :String) throws
    {
        let PresentYear = 2019
        var eligiblity = 0
        for emp1 in TTNEmployees
        {
            if(Email == emp1.empEmail)
            {
                if !emp1.isPresent
                {
                    eligiblity = 0
                    throw noBonusReasons.EmployeenotPresent(" is absent")
                }
                else
                {
                    eligiblity = 1
                }
                if (emp1.competency == "ios" || emp1.competency == "android" || emp1.competency == "BigData" || emp1.competency == "AI")
                {
                    eligiblity = 1
                }
                else
                {
                    eligiblity = 0
                    throw noBonusReasons.Competency("competency does not fall under bonus program.")
                }
                if( (PresentYear - emp1.joiningDate) > 0)
                {
                    eligiblity = 1
                }
                else
                {
                    eligiblity = 0
                    throw noBonusReasons.notCompletedoneYear("and still to complete a year with us")
                }
                if (emp1.attendancePercent >= 80)
                {
                    eligiblity = 1
                }
                else
                {
                    eligiblity = 0
                    throw noBonusReasons.attendanceLessThenEighty("do not have attandance more then eighty percent")
                }
                if(eligiblity == 1)
                {
                    print(emp1.empName ," is eligible for bonus.")
                }
            }
        }
    }
}
var obj1 = BonusProgram()
do{
try obj1.allowedForBonus(Email: "muskaan@tothenew.com")
}
catch
{
    print(error)
}
do{
    try obj1.allowedForBonus(Email: "mithlesh@tothenew.com")
}
catch
{
    print(error)
}
do{
    try obj1.allowedForBonus(Email: "ankitnigam@tothenew.com")
}
catch
{
    print(error)
}

do{
    try obj1.allowedForBonus(Email: "sachin@tothenew.com")
}
catch
{
    print(error)
}

do{
    try obj1.allowedForBonus(Email: "merry@tothenew.com")
}
catch
{
    print(error)
}

