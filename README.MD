# PoE1ToastNotifier
Notifier for in game events for PoE 1 (reads client.txt file, does not break TOS)

This script reads the client.txt file for Path Of Exile 1 and will generate a Toast popup if certain events are triggered.

As it reads the client.txt file and does not interact with the game or game files in any way it does not break the TOS (or at least, according to many sources it doesn't)

I use this tool because I play a build with high visual clutter and have Global/Trade/Guild chat open (yes yes I know) and can't always see/read/tell when a the Reflecting Mist or Nameless Seer generates in the game.

This is a variation of scripts cobbled from https://www.reddit.com/r/pathofexile/comments/1c7ynei/psa_hideout_farming_via_windows_powershell/ and other locations.

# Usage: 
You may have to disable windows DND settings for games

SETTINGS > SYSTEM > FOCUS ASSIST and then under Automatic Rules/When I'm Playing a Game.

Copy/Save the PoE1ToastNotifier.ps1 file somewhere, right click and run in powershell.

This should not require admin privelages to run as it's using native Windows features.

# Screenshots:

![](https://github.com/annedobalina/PoE1ToastNotifier/blob/main/hideout.png)

![](https://github.com/annedobalina/PoE1ToastNotifier/blob/main/mist.png)

![](https://github.com/annedobalina/PoE1ToastNotifier/blob/main/seer.png)



