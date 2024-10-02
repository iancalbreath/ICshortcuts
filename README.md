# ICshortcuts
Shortcut tool I whipped up at work to override centralized desktop shortcut administration.

README: Shortcut Cleanup and Refresh Script

[Overview]

•This script removes unwanted shortcuts from the desktop, restores custom shortcuts from a specified directory, and refreshes the Windows "Shortcut Key cache" to ensure assigned shortcut keys work properly after the script runs.  (Occasionally, Windows' icon cache erroneously preserves key assignments even after the .lnk or .url is moved or deleted, so I included the cache refresh into the script.)

[Key Functions]

•Remove Unwanted Shortcuts: Deletes System-generated shortcuts from the user's desktop.

•Reload Custom Shortcuts: Copies custom shortcuts from a folder (Shortcuts) in the script’s directory to the desktop.

•Refresh Shortcut Key Cache: Clears the icon cache and restarts Windows Explorer to ensure shortcut keys work after updating shortcuts.

•Review which and when Shortcuts have been replenished lately by viewing the auto-log: ICshortcutsLOG.txt

[How It Works]

•Shortcut Removal: Identifies and deletes specific unwanted .lnk and .url files.

•Shortcut Replenishment: Copies new or updated shortcuts to the desktop from the Shortcuts folder.

•Cache Refresh: Refreshes the Windows icon cache to reset stale shortcut key references, ensuring keys work as intended after the update.

[Usage]

•Place custom shortcuts (WITH registered Shortcut Key) in the Shortcuts folder (same directory as the script) and UPDATE THE CODE TO REFLECT YOUR CUSTOM SHORTCUTS.  

•Run the script—unwanted shortcuts will be removed, your shortcuts restored, and the icon cache refreshed.

[Notes]

•Requires administrative privileges for cache clearing.


Author: Ian Calbreath
