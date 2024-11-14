# Group Window Fix

This mod will limit the size of your group member list (default 15) and force the rest of the names to scroll properly. This fixes 
the default group window behavikor that sizes itself to your window's vertical size and sometimes will not let you scroll.
This mod works with default settings but you can change the default size to be greater or smaller than 15 members.

To change the default from 15, right click the ui_ground_hud_group.inc file and look for the "MaximumSize" variable (default line 5).

## Example:
```
		<Page
			BackgroundColor='#FFFFFF'
			BackgroundOpacity='1.00'
			Location='0,46'
			MaximumSize='16000,585'
			MinimumSize='201,39'
			Name='group'
			OnDisableEffector='/effectors.opacity.bg.fadeout'
			OnEnableEffector='/effectors.opacity.bg.fadethreequarter'
			PackLocation='nfn,nfn'
			PackSize='p'
			RStyleDefault='/Styles.window.mfd.mfd3.rs_default'
			ScrollExtent='257,153'
			Size='257,153'
			SizeIncrement='1,37'
			TextOpacityRelativeApply='true'
			TextOpacityRelativeMin='0.80'
			UserMovable='true'
			UserResizable='true'
		>
```
Change the value of "MaximumSize=" to however many members you want multiplied by 39, so for 25 members, so 975.

Old: 15 Default
> MaximumSize='16000,585'

New: 25 Members
> MaximumSize='16000,975'

To install:
Copy the ui folder to the root directory of your SWGEmu install (the folder where swgemu.exe is).
