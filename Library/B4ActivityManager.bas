B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=11.2
@EndOfDesignText@
Sub Class_Globals
	Private objActivityManager As JavaObject
	Private objPhone As Phone
	Public const LOCK_TASK_MODE_NONE As Int = 0 'Lock task mode is not active.
	Public const LOCK_TASK_MODE_LOCKED As Int = 1 'Full lock task mode is active.
	Public const LOCK_TASK_MODE_PINNED As Int = 2 'App pinning mode is active.
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	Dim NativeClass As JavaObject = Me
	objActivityManager = NativeClass.RunMethod("GetActivityManager", Null)
End Sub


'Returns "true" If the device Is running in Test Harness Mode.
Public Sub isRunningInUserTestHarness As Boolean
	Dim isAutomation As Boolean
	If objPhone.SdkVersion >= 29 Then 
		isAutomation = objActivityManager.RunMethod("isRunningInUserTestHarness", Null)
	Else
		isAutomation = objActivityManager.RunMethod("isRunningInTestHarness", Null)
	End If
	Return isAutomation
End Sub

'Return the current state of task locking. 
'The three possible outcomes are LOCK_TASK_MODE_NONE, 
'LOCK_TASK_MODE_LOCKED and LOCK_TASK_MODE_PINNED.
Public Sub 	getLockTaskModeState As Int
	Dim ret As Int
	If objPhone.SdkVersion >= 23 Then 
		ret = objActivityManager.RunMethod("getLockTaskModeState", Null)
	Else
		If objActivityManager.RunMethod("isInLockTaskMode", Null) = True Then
			ret = 1
		Else
			ret = 0
		End If
	End If
	Return ret
End Sub

'If is locked
Public Sub isInLockTaskMode As Boolean
	Dim ret As Boolean
	If objPhone.SdkVersion >= 23 Then 
		Dim aux As Int = objActivityManager.RunMethod("getLockTaskModeState", Null)
		If  aux = 1 Then
			ret = True
		Else
			ret = False
		End If
	Else
		ret = objActivityManager.RunMethod("isInLockTaskMode", Null)
	End If
	Return ret
End Sub

'Query whether the user has enabled background restrictions For this app.
'true if user has enforced background restrictions for this app, false otherwise.
'Return False in case of sdk < 28
Public Sub isBackgroundRestricted As Boolean
	Dim ret As Boolean
	If objPhone.SdkVersion >= 28 Then
		ret = objActivityManager.RunMethod("isBackgroundRestricted", Null)
	Else
		Log($"isBackgroundRestricted not supported: device[${objPhone.SdkVersion}] < 28"$)
		ret = False
	End If
	Return ret
End Sub

'Whether or not the low memory kill will be reported in
'Eeturn False in case of sdk < 30
Public Sub isLowMemoryKillReportSupported As Boolean
	Dim ret As Boolean
	If objPhone.SdkVersion >= 30 Then
		ret = objActivityManager.RunMethod("isLowMemoryKillReportSupported", Null)
	Else
		Log($"isLowMemoryKillReportSupported not supported: device[${objPhone.SdkVersion}] < 30"$)
		ret = False
	End If
	Return ret
End Sub

'Returns true if this is a low-RAM device.
'Eeturn False in case of sdk < 19
Public Sub isLowRamDevice As Boolean
	Dim ret As Boolean
	If objPhone.SdkVersion >= 19 Then
		ret = objActivityManager.RunMethod("isLowRamDevice", Null)
	Else
		Log($"isLowRamDevice not supported: device[${objPhone.SdkVersion}] < 19"$)
		ret = False
	End If
	Return ret
End Sub

'Returns "true" If the user interface Is currently being messed with by a monkey.
'Return False in case of sdk < 8
Public Sub isUserAMonkey As Boolean
	Dim ret As Boolean
	If objPhone.SdkVersion >= 8 Then
		ret = objActivityManager.RunMethod("isUserAMonkey", Null)
	Else
		Log($"isUserAMonkey not supported: device[${objPhone.SdkVersion}] < 8"$)
		ret = False
	End If
	Return ret
End Sub

' Return the approximate per-Application memory class of the current device when an 
' Application Is running with a large heap.
' Return -1 in case of sdk < 11
Public Sub 	getLargeMemoryClass As Int
	Dim ret As Int
	If objPhone.SdkVersion >= 11 Then
		ret = objActivityManager.RunMethod("getLargeMemoryClass", Null)
	Else
		Log($"getLargeMemoryClass not supported: device[${objPhone.SdkVersion}] < 11"$)
		ret = -1
	End If
	Return ret
End Sub

'Get the preferred Density of icons For the launcher.
'Return -1 in case of sdk < 11
Public Sub 	getLauncherLargeIconDensity As Int
	Dim ret As Int
	If objPhone.SdkVersion >= 11 Then
		ret = objActivityManager.RunMethod("getLauncherLargeIconDensity", Null)
	Else
		Log($"getLauncherLargeIconDensity not supported: device[${objPhone.SdkVersion}] < 11"$)
		ret = -1
	End If
	Return ret
End Sub

'Get the preferred launcher icon size.
'Return -1 in case of sdk < 11
Public Sub 	getLauncherLargeIconSize As Int
	Dim ret As Int
	If objPhone.SdkVersion >= 11 Then
		ret = objActivityManager.RunMethod("getLauncherLargeIconSize", Null)
	Else
		Log($"getLauncherLargeIconSize not supported: device[${objPhone.SdkVersion}] < 11"$)
		ret = -1
	End If
	Return ret
End Sub

'Return the approximate per-Application memory class of the current device.
'Return -1 in case of sdk < 11
Public Sub 	getMemoryClass As Int
	Dim ret As Int
	If objPhone.SdkVersion >= 11 Then
		ret = objActivityManager.RunMethod("getMemoryClass", Null)
	Else
		Log($"getMemoryClass not supported: device[${objPhone.SdkVersion}] < 11"$)
		ret = -1
	End If
	Return ret
End Sub

#if Java
import android.app.ActivityManager;
import android.content.Context;

public ActivityManager GetActivityManager()
{
  Context context = BA.applicationContext;
  ActivityManager result = (ActivityManager)context.getSystemService(Context.ACTIVITY_SERVICE);
  if (result == null)
    throw new UnsupportedOperationException("Could not retrieve ActivityManager");
  return result;
}

#End If














