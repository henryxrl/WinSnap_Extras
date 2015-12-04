# WinSnap Extras

WinSnap Extras is a simple script written in AutoHotKey. It further extends the Windows' window snapping feature by splitting screen into halfs/thirds/quarters; it's even able to divide the screen into nine windows, all by simple keyboard shortcuts.

## Installation

1. Download AutoHotKey from https://www.autohotkey.com/
2. Double click on "WinSnap_Extras.ahk" to run the script
3. Press any keyboard shortcut needed. Enjoy!

## How To Use

This tools allows you to efficiently manage windows using your keyboard in Windows.

### Windows + Arrow keys (remain as OS defined)
* Up: Maximize window
* Left: Left half of the screen
* Right: Right half of the screen
* Down: Restore or minimize window

>                +----+
>                |####|
>                |####|
>                |####|
>           +----+----+----+
>           |##  |    |  ##|
>           |##  |    |  ##|
>           |##  |    |  ##|
>           +----+----+----+

### Windows + Numpad keys (defined by this script)
Screen is divided in halfs/thirds/quarters, as shown in the figure down below.
* 0: Restore window to its previous size and position
* 1: Bottom left quarter of the screen
* 2: Bottom half of the screen (spans the screen horizontally)
* 3: Bottom right quarter of the screen
* 4: Left 1/3 of the screen (spans the screen vertically)
* 5: Center 1/3 of the screen (spans the screen vertically)
* 6: Right 1/3 of the screen (spans the screen vertically)
* 7: Top left quarter of the screen
* 8: Top half of the screen (spans the screen horizontally)
* 9: Top right quarter of the screen

>           +------+ +------+ +------+
>           |777   | |888888| |   999|
>           |777   | |888888| |   999|
>           |      | |      | |      |
>           |      | |      | |      |
>           +------+ +------+ +------+
>           |44    | |  55  | |    66|
>           |44    | |  55  | |    66|
>           |44    | |  55  | |    66|
>           |44    | |  55  | |    66|
>           +------+ +------+ +------+
>           |      | |      | |      |
>           |      | |      | |      |
>           |111   | |222222| |   333|
>           |111   | |222222| |   333|
>           +------+ +------+ +------+

### Windows + Ctrl + Numpad keys (defined by this script)
Screen is divided in nine regions, as shown in the figure down below.
* 0: Restore window to its previous size and position
* 1: Bottom left 1/9 of the screen
* 2: Bottom center 1/9 of the screen
* 3: Bottom right 1/9 of the screen
* 4: Center left 1/9 of the screen
* 5: Center center 1/9 of the screen
* 6: Center right 1/9 of the screen
* 7: Top left 1/9 of the screen
* 8: Top center 1/9 of the screen
* 9: Top right 1/9 of the screen

>           +---+ +---+ +---+
>           |7  | | 8 | |  9|
>           |   | |   | |   |
>           |   | |   | |   |
>           +---+ +---+ +---+
>           |   | |   | |   |
>           |4  | | 5 | |  6|
>           |   | |   | |   |
>           +---+ +---+ +---+
>           |   | |   | |   |
>           |   | |   | |   |
>           |1  | | 2 | |  3|
>           +---+ +---+ +---+

License
----

WinSnap Extras for Windows/Autohotkey

Copyright (C) 2015	Ruilin Xu / https://github.com/henryxrl

WinSnap Extras is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

WinSnap_Extras is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with WinSnap Extras. If not, see <http://www.gnu.org/licenses/>.

Credit
----

Modified upon wingravity.ahk by Florian. http://g.cmpl.cc/wingravity
