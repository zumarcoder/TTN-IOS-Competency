import UIKit

/*:
 
 # Question 4 :
 
 # Bounds : it is the view's rectangle in its own co- ordinate system .
 # Frame : it is the view's rectangle in the superview's co-ordinate system.
 ## When rendering within a view you typically will use “bounds”
 ## When layouting a subview you will use “frame”.

 ## Masks to bound
 Any sublayers of the layer that extend outside its boundaries will be clipped to those boundaries. Think of the layer, in that case, as a window onto its sublayers ; anything outside the edges of the window will not be visible. When masksToBounds is NO, no clipping occurs.
 When the value of this property is true, Core Animation creates an implicit clipping mask that matches the bounds of the layer and includes any corner radius effects. If a value for the mask property is also specified, the two masks are multiplied to get the final mask value.
 
 ## clipToBounds
 The use case for clipsToBounds is more for subviews which are partially outside the main view. For example, I have a (circular) subview on the edge of its parent (rectangular) UIView. If you set clipsToBounds to YES, only half the circle/subview will be shown. If set to NO, the whole circle will show up. Just encountered this so wanted to share
 
 
 ## Lazy and Strong Property
 It may be helpful to think about strong and weak references in terms of balloons.
 
 A balloon will not fly away as long as at least one person is holding on to a string attached to it. The number of people holding strings is the retain count. When no one is holding on to a string, the ballon will fly away (dealloc). Many people can have strings to that same balloon. You can get/set properties and call methods on the referenced object with both strong and weak references.
 
 A strong reference is like holding on to a string to that balloon. As long as you are holding on to a string attached to the balloon, it will not fly away.
 
 A weak reference is like looking at the balloon. You can see it, access it's properties, call it's methods, but you have no string to that balloon. If everyone holding onto the string lets go, the balloon flies away, and you cannot access it anymore.
 
 */
