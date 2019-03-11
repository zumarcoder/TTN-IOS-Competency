import UIKit

/*:
 frame is the orientation from the super view that is x and y from the super view.
 
 bound is same as the frame but the differnce is the orientation of the view bound to itself that means its (x,y) = (0,0)
 
 Clip to Bound is the property that the elements outside the view must not go outside to that view like shadow will not be appear when the clip to bound will be true.
 
 Mask to Bound
 
 # Strong
 A strong property means that you want to “own” the object. Only when you set the property to nil will the object be  destroyed. Unless one or more objects also have a strong reference to the object. This is the one you will use in most cases.
 
 * Creates ownership between property and assigned value.
 * This is default for object property in ARC so it does not let you worrying about reference count and release the reference automatically.
 * It is replacement for retain. We use if and only if we need to use as retain.
 
 
 # Lazy
 As a direct opposite too strong properties the weak property means you don’t want to have control over the objects lifecycle. The object only lives on while another objects has a strong reference to it. If there are no strong references to the object then it will be destroyed. The most common scenario for a weak property is for subviews of a view controllers view. Because these subviews are already strongly held by the view controllers view.
 
 * Creates non-ownerships between property and assigned value.
 * Strong is used on parent object and weak is used on child object when parent is released then child object reference is also set to nil
 * It helps to prevents retain cycles.
 
 
 */
