# MixPlayer
Free app designed to adapt to take advantage of larger desktop displays, and shrink down for use on mobile devices.

Built using Qt 5.4 and distributed under the GPL (see license).

Play two separate tracks of mp3, flac, ogg or wav independently and easily by organising them by folder and name.

Also has a few nice additional features like storing images associated with each track and adding text information to be displayed for each track.

Adapts to size of display and if big enough also has sorting and search.

Note that this app was developed in a short time and implemented with utility in mind with minimal consideration to how it looks. I.e. it was thrown together for my personal use, but feel free to use and adapt it to your own needs.

# Basic Use

On desktops changing window size will change how much is displayed.

Full layout is playlist on the left, two players in the middle and another playlist on the right. The top player plays the left playlist and the bottom player plays the right playlist.

![](http://i955.photobucket.com/albums/ae34/Bornich/MixPlayerScreenshot_zps8ev7ekcq.png)

On a mobile phone or when sized to a smaller size tap the top title bar, with the time and date display, to navigate from the first list, to players, to the second list, and then back again to the first list.

The player has no playlist functionality, but relies on the user organising music files in folders.

Dropdown at the top allows sorting the files and folders based on "name" (default), "time", "size" and "type", and the order of the list can be determined by clicking on "ascending" or "descending".

Above the dropdown a search window is available that will reduce the files and folders shown as letters are typed.

An "up" buttons allows navigating up from folders towards the root, whereas clicking on a folder will open that folder and present the files and folders in that folder.

The player icons are fairly simple:

* Skip to previous song
* Skip to next song
* Stop
* Play / Pause
* Mute / Unmute
* Volume 0-100%
* Loop track on/off

Basic information about the song playing is also presented.

The current time and date is always presented at the top, along with a simple timer in square brackets that counts how long the app has been running.
