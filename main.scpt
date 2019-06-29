# Applescript create by chris1111
# Applescript Create Install Media any OS X
# Applescript adjust for Catalina 10.15
# (c) Copyright 2018, 2019 chris1111 

set theAction to button returned of (display dialog "
Welcome Create Install Media
You can create a bootable USB key 
from OS X 10.9 to macOS 10.15
" with icon note buttons {"Quit", "Clover Installer ", "Create Install Media"} cancel button "Quit" default button {"Create Install Media"})
# Delete my temporary folder if exist
do shell script " rm -rf /$HOME/Library/Install_-macOS/"
set source to path to me as string
set source to POSIX path of source & "Contents/Resources/Installer.pkg"
set source to quoted form of source
if theAction = "Clover Installer" then do shell script "open " & source & "/"
set source to path to me as string
--If Création USB
if theAction = "Create Install Media" then
	display dialog "Format your USB Drive with Disk Utility 
in the format Mac OS Extended (Journaled) 
GUID Partition Map

*****************************
You must quit Disk Utility to continue 
installation !" with icon note buttons {"Quit", "Continue"} cancel button "Quit" default button {"Continue"}
	tell application "Disk Utility"
		activate
	end tell
	
	repeat
		if application "Disk Utility" is not running then exit repeat
		
	end repeat
	
	activate me
	set all to paragraphs of (do shell script "ls /Volumes")
	set w to choose from list all with prompt " 
Select the Drive you have just formatted.

Then press the OK button" OK button name "OK" with multiple selections allowed
	if w is false then
		display dialog "Quit Installer " with icon note buttons {"EXIT"} default button {"EXIT"}
		
		return
	end if
	try
		repeat with teil in w
			do shell script "diskutil `diskutil list | awk '/ " & teil & "  / {print $NF}'`" with administrator privileges
		end repeat
	end try
	
	set theName to "Install-Media"
	tell application "Finder"
		set name of disk w to theName
		
	end tell
	--If Continue	
	set theAction to button returned of (display dialog "

Choose the location of your Install macOS.app" with icon note buttons {"Quit", "10.9 to 10.12", "10.13 to 10.15"} cancel button "Quit" default button {"10.13 to 10.15"})
	if theAction = "10.13 to 10.15" then
		--If 10.13 to 10.15
		set theAction to button returned of (display dialog "
	Your choice is 10.13 to 10.15 
	Choose your Install OS X.app 
	From macOS High Sierra to macOS Catalina" with icon note buttons {"Quit", "Continue"} cancel button "Quit" default button {"Continue"})
		set source1 to path to me as string
		set source1 to POSIX path of source1 & "Contents/Resources/Choose.app"
		set source1 to quoted form of source1
		if theAction = "Continue" then do shell script "mkdir -p /$HOME/Library/" & quoted form of "Install_-macOS"
		if theAction = "Continue" then do shell script "open " & source1 & "/"
		set source1 to path to me as string
		
		tell application "Choose"
			activate
		end tell
		
		repeat
			if application "Choose" is not running then exit repeat
			
		end repeat
		say "Processing Install mac OS!"
		delay 2
		
		set progress description to "Create Install Media
======================================
Installation time 15 to 20 min on a standard USB key
3 to 5 min on a Disk Ext HD
======================================
"
		
		set progress total steps to 7
		
		set progress additional description to "Analysing Install macOS"
		delay 2
		set progress completed steps to 1
		
		set progress additional description to "Analysing USB Install Media"
		delay 2
		set progress completed steps to 2
		
		set progress additional description to "Install USB Media OK"
		delay 2
		set progress completed steps to 3
		
		set progress additional description to "Install in Progress "
		delay 1
		set progress completed steps to 4
		
		set progress additional description to "Install in Progress Wait! "
		delay 1
		set progress completed steps to 5
		
		set progress additional description to "Installing macOS  wait . . . ."
		delay 1
		tell application "Create Install Media"
			activate
		end tell
		--display dialog cmd
		do shell script "/$HOME/Library/Install_-macOS/Install*.app/Contents/Resources/createinstallmedia --volume /Volumes/Install-Media --nointeraction" with administrator privileges
		set progress completed steps to 6
		
		set progress additional description to "Install in Progress 90%"
		delay 2
		# Delete my temporary folder
		do shell script " rm -rf /$HOME/Library/Install_-macOS/"
		set progress completed steps to 7
		set progress additional description to "
Create Install Media Completed 100% ➤ opening the Clover Installer!
Create Install Media Completed !"
		delay 3
		set theFile to ((path to me) as string) & "Contents:Resources:Installer.pkg"
		tell application "Finder" to open theFile
		
		
	else if theAction = "10.9 to 10.12" then
		
		--If 10.9 to 10.12
		set theAction to button returned of (display dialog "
10.9 to 10.12
Choose the location of your Install macOS.app
From OS X Mavericks to macOS Sierra" with icon note buttons {"Quit", "Continue"} cancel button "Quit" default button {"Continue"})
		set source1 to path to me as string
		set source1 to POSIX path of source1 & "Contents/Resources/Choose.app"
		set source1 to quoted form of source1
		if theAction = "Continue" then do shell script "mkdir -p /$HOME/Library/" & quoted form of "Install_-macOS"
		if theAction = "Continue" then do shell script "open " & source1 & "/"
		set source1 to path to me as string
		
		tell application "Choose"
			activate
		end tell
		
		repeat
			if application "Choose" is not running then exit repeat
			
		end repeat
		say "Processing Install mac OS!"
		delay 2
		
		
		set progress description to "Create Install Media
======================================
Installation time 15 to 20 min on a standard USB key
3 to 5 min on a Disk Ext HD
======================================
"
		
		set progress total steps to 7
		
		set progress additional description to "Analysing Install macOS"
		delay 2
		set progress completed steps to 1
		
		set progress additional description to "Analysing USB Install Media"
		delay 2
		set progress completed steps to 2
		
		set progress additional description to "Install USB Media OK"
		delay 2
		set progress completed steps to 3
		
		set progress additional description to "Install in Progress "
		delay 1
		set progress completed steps to 4
		
		set progress additional description to "Install in Progress Wait! "
		delay 1
		set progress completed steps to 5
		
		set progress additional description to "Installing macOS  wait . . . ."
		delay 1
		tell application "Create Install Media"
			activate
		end tell
		--display dialog cmd
		do shell script "/$HOME/Library/Install_-macOS/Install*.app/Contents/Resources/createinstallmedia --volume /Volumes/Install-Media --applicationpath /$HOME/Library/Install_-macOS/Install*.app --nointeraction" with administrator privileges
		set progress completed steps to 6
		
		set progress additional description to "Install in Progress 90%"
		delay 2
		# Delete my temporary folder
		do shell script " rm -rf /$HOME/Library/Install_-macOS/"
		set progress completed steps to 7
		set progress additional description to "
Create Install Media Completed 100% ➤ opening the Clover Installer!
Create Install Media Completed !"
		delay 3
		set theFile to ((path to me) as string) & "Contents:Resources:Installer.pkg"
		tell application "Finder" to open theFile
	end if
end if
