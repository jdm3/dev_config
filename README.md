### Some windows registry settings

Custom filter keys settings (reboot required).  See winuser.h FILTERKEYS documentation for Flags description.

```.reg
    [HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response]
    "AutoRepeatDelay"="180"
    "AutoRepeatRate"="5"
    "BounceTime"="0"
    "DelayBeforeAcceptance"="0"
    "Flags"="3"
```

Small icons in task bar (explorer restart required):

```.reg
    [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
    "TaskbarSmallIcons"="1"
```

Display windows build version on desktop (reboot required):

```.reg
    [HKEY_CURRENT_USER\Control Panel\Desktop]
    "PaintDesktopVersion"="1"
```
