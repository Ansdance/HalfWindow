
### presentViewController
* The new view controller is presented MODALLY
* The new view controller is NOT added to the existing navigation stack and is not contained by your nav controller
* You DO NOT get a navigation bar and back button
* **modalPresentationStyle == .automatic**
  * Presents the new view controller on top of the current view controller
  * The top of current view controller can be seen “underneath” the new view controller
  * The user can dismiss the new view controller by dragging down
  * As it's not part of the navigation stack, there is no navigation bar
* **modalPresentationStyle == .fullscreen**    
  * Presents the new view controller on top of the current view controller
  * The current view controller CANNOT be seen underneath the new view controller
  * There is no way for the user dismiss the new view controller
  * As it's not part of the navigation stack, there is no navigation bar (the user is "stuck")

### pushViewController
* Pushes the new view controller onto the EXISTING navigation stack
* The new view controller is NOT presented modally
* The new view controller is always presented full screen (it's indepedent of modalPresentationStyle)
* You automatically get a navigation bar and back button

