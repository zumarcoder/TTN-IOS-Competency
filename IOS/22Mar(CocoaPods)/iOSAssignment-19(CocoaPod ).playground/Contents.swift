import UIKit


//: # Session : iOS : Cocoapods & Third Party Integration / Dependancy Manager/ Frameworks

//: ## 1). Explain the pod integration cycle
/*:
 ### The integration cycle of pod follows the following steps:
 ### Step 1: Installation of POD
 ## sudo gem install cocoapods
 ### Step 2: Then we have to go to root directory in the terminal and enter the command
 ## pod init
 ### Step 3: Then go to Podfile present in our project directory and run the following command
 ## pod 'PODNAME', '~> VERSION'
 ### Step 4: Then run the following command
 ## pod install
 ### Step 5: Then after that its time to update the pod when its available run the following command
 ## pod update PODNAME
 */


//: ## 2). How to update only a single pod
/*:
 ### pod update PODNAME
 Using this command we can update the single or required pod.
 */


//: ## 3). Delete a pod from project
/*:
 ### Pod can be deleted by following these steps
 Step 1: Cocoapods-Deintegrate Plugin by running the command
 ### pod deintegrate
 
 Step 2: Cocoapods-Clean Plugin by running the command
 ### pod clean
 ### rm Podfile
 */


//: ## 4). Update to a particular lib version
/*:
 ### pod update 'PODNAME', 'VERSION'
 Using this command we can update to a particular lib version
 */

