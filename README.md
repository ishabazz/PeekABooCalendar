# Peek A Boo Calendar
Peek a Boo calendar  is a demo project that I made to teach state restoration. It’s composed of a UITabBarController that  lets you tab between 2017, 2018 and 2019.  Each of those tabs has a list of month, which when tapped, reveal a list of dates in that month. Tapping a date reveals a detail view where you can type a note. 


## Branches
*****
**Default**  - This is the initial app without any state restoration.

**Basic** - This is very basic state restoration that reserves the hierarchy and static content, but no dynamic data.

**Encode Data** - This is a nearly perfect implementation which stores hierarchy and data, but doesn’t store the scroll positions of the tableviews. 

**Scroll Position** - This is the full implementation of state restoration .

**Complex** - This implementation uses custom modal views instead of the navigation controller….and it breaks.

**Dynamic ViewControllers** -  This  restores state restoration in  a scene that uses a dynamic  modal view controller.

**Opting Out**  - This branch add exceptions for state restoration and opts out of state restoration if the version has changed since the last time the app was running. 
