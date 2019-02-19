import UIKit

/*:

 # Assignment
 ## Explain what is Xcode?
* Xcode is a software package used by programmers to write software for Mac OS X, iOS devices the Apple Watch, and now the Apple TV.
* Xcode is a type of package called an IDE with editors, compilers, and other software tools that work together to help you **write software, compile it, load it onto a device, debug it**, and ultimately submit it to the app store.
 ---
 
 ## Explain how you can add frameworks in Xcode project?
 1. Select the project file from the project navigator on the left side of the project window.
 2. Select the target for where you want to add frameworks in the project settings editor.
 3. Select the “Build Phases” tab, and click the small triangle next to “Link Binary With Libraries” to view all of the frameworks in your application.
 4. To Add frameworks, click the “+” below the list of frameworks.
 5. To select multiple frameworks, press and hold the command key while using the mouse to click the desired frameworks.
 
 ---
 
 ## Explain what is the difference between Xcode, Cocoa and Objective C?
 * Xcode is the integrated development environment (IDE)—the application—that developers use to write software for iOS and/or OS X. It includes the editor, the build system (determining what to build to produce the desired target), and quite a few other things.
 * Objective-C is the main language that developers write such software in. They may write bits of it in pure C, use C++ or combine it with Objective-C (producing Objective-C++), or write some or all of the program in another language entirely, such as MacRuby, Java (with j2objc), or C# (with MonoTouch).
 * Cocoa is an application frameworks. It is a suite of many individual frameworks You can use a framework besides Cocoa or Cocoa Touch, but you'll have to have some Cocoa/Cocoa Touch code, at some level, in order for your application to talk to the system, receive events, draw, etc. Frameworks that specifically target Mac and/or iOS will include the relevant wrappers for you, at varying levels of quality.
 ---
 
 ## What is the short cut to open the “Code Snippet Library” in Xcode?
 There is a button on upper right corner side of the playground likw this "{}" we can use that by clicking it then some suggestion come and we can choose of them which snippet we want to use.
 ## Mention what are the build phases available in Xcode?
 * Target Dependencies
 * Check pods Manifest.log
 * Compile Sources
 * Link Binary with Libraries
 * Copy Bundle Resource
 * Copy Pods Resource
 
 ---
 
 ## Explain how app delegate is declared by Xcode project templates?
  * protocol UIApplicationDelegate
 The app delegate is effectively the root object of your app. Like the UIApplication object itself, the app delegate is a singleton object and is always present at runtime. Although the UIApplication object does most of the underlying work to manage the app, you decide your app’s overall behavior by providing appropriate implementations of the app delegate’s methods.
 ---
 
 ## Explain how you define variables in Swift language?
 */
var intVariable : Int = 4
var doubleVariable : Double = 4.4
var stringVariable : String = "Akash"
var arrayVariable : [String] = ["a","k","a","s","h"]
/*:
 ---
 ## What is interface builder?
 The Interface Builder editor within Xcode makes it simple to design a full user interface without writing any code. Simply drag and drop windows, buttons, text fields, and other objects onto the design canvas to create a functioning user interface.
 
 
 ## List devices and their resolutions, screen size has iOS as their OS.
 * iphone         320X480    3.5  iphone os 1
 * iphone3G       480X320    3.5  iphone os 2
 * iphone3Gs      480X320    3.5  iphone os 3
 * iphone4        960X640    3.5  ios 4
 * iphone4s       960X640    3.5  ios 5
 * iphone5        1136X640   4    ios 6
 * iphone5c       640X1136   4    ios7
 * iphone5s       640X1136   4    ios7.0
 * iphone6        1334X750   4.7  ios8.0
 * iphone6+       1920X1080  5.5  ios8.0
 * iphone6s       1334X750   4.7  ios9.0
 * iphone6s+      1920X1080  5.5  ios9.0
 * iphone5SE      1136X640   4    ios9.3
 * iphone7        1334X750   4.7  ios10.0.1
 * iphone7+       1920X1080  5.5  ios10.0.1
 * iphone8        1334X750   4.7  ios11.0
 * iphone8+       1920X1080  5.5  ios11.1
 * iphoneX        2436X1125  5.8  ios11.0.1
 * iphoneXS       2436X1125  5.8  ios12.0
 * iphoneXSmax    2688X1242  6.5  ios12.0
 * iphoneXR       1792X828   6.06 ios12.0
 
 
 */
