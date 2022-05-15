# B4B4ActivityManager
 Wraps some ActivityManager state functions into B4A
 
 ## Implemented Functions
 
 The following functions are implemented:
 
* isRunningInUserTestHarness: Returns "true" If the device Is running in Test Harness Mode.
* getLockTaskModeState: Return the current state of task locking. The three possible outcomes are LOCK_TASK_MODE_NONE, LOCK_TASK_MODE_LOCKED and LOCK_TASK_MODE_PINNED.
* isInLockTaskMode: Return true if is locked.
* isBackgroundRestricted: Query whether the user has enabled background restrictions For this app. true if user has enforced background restrictions for this app, false otherwise. Emits a log warning and return False in case of sdk < 28.
* isLowMemoryKillReportSupported: Whether or not the low memory kill will be reported in. Emits a log warning and return  False in case of sdk < 30.
* isLowRamDevice: Returns true if this is a low-RAM device. Emits a log warning and return  False in case of sdk < 19.
* isUserAMonkey: Returns "true" If the user interface Is currently being messed with by a monkey. Emits a log warning and return  False in case of sdk < 8.
* getLargeMemoryClass: Return the approximate per-Application memory class of the current device when an Application Is running with a large heap. Emits a log warning and return  -1 in case of sdk < 11.
* getLauncherLargeIconDensity: Get the preferred Density of icons For the launcher. Emits a log warning and return  -1 in case of sdk < 11.
* getLauncherLargeIconSize: Get the preferred launcher icon size. Emits a log warning and return -1 in case of sdk < 11.
* getMemoryClassReturn the approximate per-Application memory class of the current device. Emits a log warning and return  in case of sdk < 11.

## Testing

The project contains an app with 2 buttons, one test for robots and another run all methods.

![TEST SCREENSHOT](https://raw.githubusercontent.com/alejivo/B4B4ActivityManager/master/Img/Resultado.PNG)

## Folder structure

* Dist: Library to be distributed on B4X Library folder
* Img: Images
* Library: The library source code.
* Testapp: The testing app.


## Contact

[@alejivo](https://twitter.com/alejivo) - contact@alejivo.com

[www.linkedin.com/in/alejivo](www.linkedin.com/in/alejivo)

Project Link: [https://github.com/alejivo/B4B4ActivityManager](https://github.com/alejivo/B4B4ActivityManager)

