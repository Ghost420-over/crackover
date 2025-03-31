# Crackover

The file is what it's needed to reset the bottles. Works up to the most recent version of crossover (25)

**_THE METHODS ARE NOT MINE. I FOUND THE BOTTLE RESET METHOD IN A YOUTUBE VIDEO. I JUST AUTOMATED IT. THE TRIAL RESET COMES FROM A REDDIT POST._**

[The video in question](https://www.youtube.com/watch?v=d4Hlm9kJrEo)

# Yes, the code is partially generated by an AI. I'm bad at coding but it works, at least.

### Small tutorial on how to reset the trial and the bottles:

#### 1) Preparation:

1. Make sure CrossOver is fully closed and _ALL_ Windows emulated apps are _NOT_ running.
2. Make sure to have a firewall program like LuLu and Little Snitch and block Codeweavers' domains.
3. Download a **proper** code editor, like Sublime Text or Visual Studio Code.
4.Download a program like Prefs Editor, or whatever .plist file editor your prefer.
5. Download the Bottle Reset Utility.

#### 2) Operation pt.1: resetting the program's trial

1. Open the .prefs editor and open the com.codeweavers.CrossOver file.
2. Select the `FirstRunDate` value and set it to your preferred date and your preferred time (ideally today).
3. Save the file and quit
4. Test by opening the program. The trial should be reset.

#### 3) Operation pt.2: Resetting the bottle.

1. Open the `.command` file in your code editor.
2. At line 4, insert the path to the `system.reg` file in the bottle you want to reset. The code assumes your bottle is called "Steam".
3. Save and quit.
4. Open a terminal window.
5. Run the `sudo su` command and enter your password.
6. Type `sudo`, drag the `.command` file you just edited into the terminals window and press enter
7. If everything runs correctly, the code should be now prompting to delete the following lines:
`[Software\\CodeWeavers\\CrossOver\\cxoffice] 1743349992`  
`#time=1dba18bd74f2b30`  
`"InstallTime"=dword:6c4586c4`  
`"NagTime"=dword:6a06b611`  
`"Version"=dword:547445c7`  
9. Press `y`, and then `enter`
10. The utility has now made a backup of the `system.reg` file called `system.reg.bak`, in case anything goes wrong, you can undo the damages by deleting the damaged file and deleting the `.bak` extension from the backed-up file.
11. Test everything works by running a program. CrossOver now should not be bothering you for 14 days.
12. Set a reminder to repeat this process once a week.

# DONE!
