This mod will limit the size of your group member list (default 15) and force the rest of the names to scroll properly. This fixes 
the default group window behavikor that sizes itself to your window's vertical size and sometimes will not let you scroll.
This mod works with default settings but you can change the default size to be greater or smaller than 15 members.

To change the default from 15, right click the ui_ground_hud_group.inc file and look for the "MaximumSize" variable (default line 5).

Change the value of "MaximumSize=" to however many members you want multiplied by 39, so for 25 members, so 975.



To install:
Copy the ui folder to the root directory of your SWGEmu install (the folder where swgemu.exe is).