import UIKit

//Structure for personal info

struct personal
    {
        var employeeId : Int
        var name : String
        var country : String
        var address : String
        var hobbies : String?
    }

//Structure for professional info

struct professional
    {
        var employeeId : Int
        var name : String
        var department : String
        var branch : String
        var experience : String
    }

//Structure for common info union of personal and professional structure

struct common
    {
    var employeeId : Int
    var name : String
    var country : String?
    var address : String?
    var hobbies : String?
    var department : String?
    var branch : String?
    var experience : String?
    }

//for sekected countries and department only
 var Country = ["India","America","Britain","Japan","China"]
 var Department = ["India","America","Britain","Japan","China"]
 var Branch = ["Ios","Jvm","Android","Full stack","Web"]

//creating objects of structures personal
var personal1 = personal(employeeId: 101, name: "Akash",  country: Country[0], address: "Ghaziabad", hobbies: "Badminton")
var personal2 = personal(employeeId: 102, name: "Arjun",  country: Country[0], address: "Lukhnow", hobbies: "football")
var personal3 = personal(employeeId: 103, name: "Shobit",  country: Country[3], address: "Delhi", hobbies: "Gaming")

//creating objects of structures professional
var professional1 = professional(employeeId: 101, name: "Akash", department: Department[0], branch: Branch[0], experience: "fresher")
var professional2 = professional(employeeId: 102, name: "Arjun", department: Department[1], branch: Branch[0], experience: "fresher")
var professional3 = professional(employeeId: 104, name: "karan", department: Department[3], branch: Branch[3], experience: "fresher")
var professional4 = professional(employeeId: 106, name: "Aman", department: Department[4], branch: Branch[3], experience: "fresher")

//adding all the personal structures object to an Array
var personalArray : [personal] = []
personalArray.append(personal1)
personalArray.append(personal2)
personalArray.append(personal3)

//adding all the professional structures object to an Array
var professionalArray : [professional] = []
professionalArray.append(professional1)
professionalArray.append(professional2)
professionalArray.append(professional3)

//Adding all the information of personal and professional into common array
var commonArray : [common] = []


print("Question 1 :")
func appendingToCommonArray(personalArray1 : [personal] , professionalArray1 : [professional])
{
for emp1 in personalArray1
{
    for emp2 in professionalArray1
    {
        if(emp1.employeeId==emp2.employeeId )
            
        {
            commonArray.append(common(employeeId: emp1.employeeId, name: emp1.name, country: emp1.country, address: emp1.address, hobbies: emp1.hobbies!, department: emp2.department, branch: emp2.branch, experience: emp2.experience))
        }
    }
    
}
}

//calling the function to add the elements
appendingToCommonArray(personalArray1 : personalArray , professionalArray1 : professionalArray)

//printing the common Array
for emp1 in commonArray{
    print("Name :" , emp1.name , "\nEmployee Id :" , emp1.employeeId ,"\nDepartment :",emp1.department!,"\nCountry :",emp1.country!,"\nAddress :",emp1.address!,"\nhobbies :",emp1.hobbies!,"\nExperience :",emp1.experience!)
    print("\n")
}


print("\n \n \n")
print("Question 2 :")
func tellNameWithCountry(Array1 : [personal] , Array2 : [professional])
{
    for emp1 in Array1
        {
    
                print(emp1.name," lives in ",emp1.country)
        }
    for emp2 in Array2
        {
                print(emp2.name," lives in ",emp2.department)
        }

}
tellNameWithCountry(Array1: personalArray , Array2: professionalArray);



print("\n \n \n")
print("Question 3 :")
func tellNameWithDepartment(Array2 : [professional])
{
    for emp1 in Array2
    {
        
        print(emp1.name,"'s Department is in ",emp1.department)
    }
}
tellNameWithDepartment(Array2: professionalArray);




print("\n \n \n")
print("Question 4 :")

func sameCountrySameBranch(commonArray1 : [common])
{
    for emp1 in commonArray1
    {
        if(emp1.country == emp1.department)
        {
            print(emp1.name,"Lives in same country and works in sane department")
        }
    }
}
sameCountrySameBranch(commonArray1: commonArray )





print("\n \n \n")
print("Question 5 :")
func sameHobbyandExperince( commonArray1 : [common] )
{
    for emp1 in commonArray1
    {
        if(emp1.hobbies != nil && emp1.experience != nil )
            {
                    print("Name :" , emp1.name , "\nEmployee Id :" , emp1.employeeId ,"\nDepartment :",emp1.department! ,"\nCountry :",emp1.country! ,"\nAddress :",emp1.address! ,"\nhobbies :",emp1.hobbies! ,"\nExperience :",emp1.experience! )
                    print("\n")
            }
    }
}
sameHobbyandExperince(commonArray1: commonArray)




print("\n \n \n")
print("Question 6 :")
func startsWithS(personal1 : [personal] , professional1 : [professional] )

{
    for emp1 in personal1
        { if(emp1.name.hasPrefix("S"))
    {
print("Name :" , emp1.name , "\nEmployee Id :" , emp1.employeeId ,"\nCountry :",emp1.country ,"\nAddress :",emp1.address ,"\nhobbies :",emp1.hobbies! )
    }
}
}

startsWithS(personal1 : personalArray , professional1 : professionalArray)
