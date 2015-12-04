;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; WinSnap_Extras.ahk
;; WinSnap Extras for Windows/Autohotkey
;; Copyright (C) 2015	Ruilin Xu / https://github.com/henryxrl
;;
;; WinSnap Extras is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; WinSnap_Extras is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with WinSnap Extras. If not, see <http://www.gnu.org/licenses/>.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This tools allows you to efficiently manage windows using your keyboard
;; in Windows.
;;
;; Windows + Arrow keys is mapped like this:
;; (remain unchanged)
;;                 +----+
;;                 |####| Up: maximize
;;                 |####|
;;                 |####|
;;            +----+----+----+
;; Left:      |##  |    |  ##|
;; use left   |##  |    |  ##| right: use right half of the screen
;; half of    |##  |    |  ##|
;; the screen +----+----+----+
;;                  Down: restore or minimize
;;
;; Windows + Numpad keys is mapped like this:
;; (screen divided in halfs/thirds/quarters)
;; +------+ +------+ +------+
;; |777   | |888888| |   999|
;; |777   | |888888| |   999|
;; |      | |      | |      |
;; |      | |      | |      |
;; +------+ +------+ +------+
;; |44    | |  55  | |    66|
;; |44    | |  55  | |    66|
;; |44    | |  55  | |    66|
;; |44    | |  55  | |    66|
;; +------+ +------+ +------+
;; |      | |      | |      |
;; |      | |      | |      |
;; |111   | |222222| |   333|
;; |111   | |222222| |   333|
;; +------+ +------+ +------+
;; 0: Restore/Minimize
;;
;; Windows + Ctrl + Numpad keys is mapped like this:
;; (screen divided in thirds)
;; +---+ +---+ +---+
;; |7  | | 8 | |  9|
;; |   | |   | |   |
;; |   | |   | |   |
;; +---+ +---+ +---+
;; |   | |   | |   |
;; |4  | | 5 | |  6|
;; |   | |   | |   |
;; +---+ +---+ +---+
;; |   | |   | |   |
;; |   | |   | |   |
;; |1  | | 2 | |  3|
;; +---+ +---+ +---+
;; 0: Restore/Minimize
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;