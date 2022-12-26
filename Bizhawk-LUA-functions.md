## Contents
[bit](#bit) | [bizstring](#bizstring) | [client](#client) | [comm](#comm) | [console](#console) | [emu](#emu) | [event](#event) | [forms](#forms) | [gameinfo](#gameinfo) | [genesis](#genesis) | [gui](#gui) | [input](#input) | [joypad](#joypad) | [LuaCanvas](#LuaCanvas) | [mainmemory](#mainmemory) | [memory](#memory) | [memorysavestate](#memorysavestate) | [movie](#movie) | [nds](#nds) | [nes](#nes) | [savestate](#savestate) | [snes](#snes) | [SQL](#SQL) | [tastudio](#tastudio) | [userdata](#userdata)

## bit
### A library for performing standard bitwise operations.

bit.arshift
- int bit.arshift(uint val, int amt)
- Arithmetic shift right of 'val' by 'amt' bits

bit.band
- uint bit.band(uint val, uint amt)
- Bitwise AND of 'val' against 'amt'

bit.bnot
- uint bit.bnot(uint val)
- Bitwise NOT of 'val'

bit.bor
- uint bit.bor(uint val, uint amt)
- Bitwise OR of 'val' against 'amt'

bit.bxor
- uint bit.bxor(uint val, uint amt)
- Bitwise XOR of 'val' against 'amt'

bit.byteswap_16
- ushort bit.byteswap_16(ushort val)
- Byte swaps 'short', i.e. bit.byteswap_16(0xFF00) would return 0x00FF

bit.byteswap_32
- uint bit.byteswap_32(uint val)
- Byte swaps 'dword'

bit.byteswap_64
- ulong bit.byteswap_64(ulong val)
- Byte swaps 'long'

bit.check
- bool bit.check(long num, int pos)
- Returns result of bit 'pos' being set in 'num'

bit.clear
- long bit.clear(uint num, int pos)
- Clears the bit 'pos' in 'num'

bit.lshift
- uint bit.lshift(uint val, int amt)
- Logical shift left of 'val' by 'amt' bits

bit.rol
- uint bit.rol(uint val, int amt)
- Left rotate 'val' by 'amt' bits

bit.ror
- uint bit.ror(uint val, int amt)
- Right rotate 'val' by 'amt' bits

bit.rshift
- uint bit.rshift(uint val, int amt)
- Logical shift right of 'val' by 'amt' bits

bit.set
- uint bit.set(uint num, int pos)
- Sets the bit 'pos' in 'num'

## bizstring
### A library exposing standard .NET string methods

bizstring.binary
- string bizstring.binary(long num)
- Converts the number to a string representation of the binary value of the given number

bizstring.contains
- bool bizstring.contains(string str, string str2)
- Returns whether or not str contains str2

bizstring.endswith
- bool bizstring.endswith(string str, string str2)
- Returns whether str ends wth str2

bizstring.hex
- string bizstring.hex(long num)
- Converts the number to a string representation of the hexadecimal value of the given number

bizstring.octal
- string bizstring.octal(long num)
- Converts the number to a string representation of the octal value of the given number

bizstring.remove
- string bizstring.remove(string str, int position, int count)
- Returns a string that represents str with the given position and count removed

bizstring.replace
- string bizstring.replace(string str, string str2, string replace)
- Returns a string that replaces all occurrences of str2 in str1 with the value of replace

bizstring.split
- nluatable bizstring.split(string str, string separator)
- Splits str into a Lua-style array using the given separator (consecutive separators in str will NOT create empty entries in the array). If the separator is not a string exactly one char long, ',' will be used.

bizstring.startswith
- bool bizstring.startswith(string str, string str2)
- Returns whether str starts with str2

bizstring.substring
- string bizstring.substring(string str, int position, int length)
- Returns a string that represents a substring of str starting at position for the specified length

bizstring.tolower
- string bizstring.tolower(string str)
- Returns an lowercase version of the given string

bizstring.toupper
- string bizstring.toupper(string str)
- Returns an uppercase version of the given string

bizstring.trim
- string bizstring.trim(string str)
- returns a string that trims whitespace on the left and right ends of the string

## comm
### A library for communicating with other programs

comm.getluafunctionslist
- string comm.getluafunctionslist()
- returns a list of implemented functions

comm.httpGet
- string comm.httpGet(string url)
- makes a HTTP GET request

comm.httpGetGetUrl
- string comm.httpGetGetUrl()
- Gets HTTP GET URL

comm.httpGetPostUrl
- string comm.httpGetPostUrl()
- Gets HTTP POST URL

comm.httpPost
- string comm.httpPost(string url, string payload)
- makes a HTTP POST request

comm.httpPostScreenshot
- string comm.httpPostScreenshot()
- HTTP POST screenshot

comm.httpSetGetUrl
- void comm.httpSetGetUrl(string url)
- Sets HTTP GET URL

comm.httpSetPostUrl
- void comm.httpSetPostUrl(string url)
- Sets HTTP POST URL

comm.httpSetTimeout
- void comm.httpSetTimeout(int timeout)
- Sets HTTP timeout in milliseconds

comm.httpTest
- string comm.httpTest()
- tests HTTP connections

comm.httpTestGet
- string comm.httpTestGet()
- tests the HTTP GET connection

comm.mmfCopyFromMemory
- int comm.mmfCopyFromMemory(string mmf_filename, long addr, int length, string domain)
- Copy a section of the memory to a memory mapped file

comm.mmfCopyToMemory
- void comm.mmfCopyToMemory(string mmf_filename, long addr, int length, string domain)
- Copy a memory mapped file to a section of the memory

comm.mmfGetFilename
- string comm.mmfGetFilename()
- Gets the filename for the screenshots

comm.mmfRead
- string comm.mmfRead(string mmf_filename, int expectedsize)
- Reads a string from a memory mapped file

comm.mmfReadBytes
- nluatable comm.mmfReadBytes(string mmf_filename, int expectedsize)
- Reads bytes from a memory mapped file

comm.mmfScreenshot
- int comm.mmfScreenshot()
- Saves screenshot to memory mapped file

comm.mmfSetFilename
- void comm.mmfSetFilename(string filename)
- Sets the filename for the screenshots

comm.mmfWrite
- int comm.mmfWrite(string mmf_filename, string outputstring )
- Writes a string to a memory mapped file

comm.mmfWriteBytes
- int comm.mmfWriteBytes(string mmf_filename, nluatable bytearray)
- Write bytes to a memory mapped file

comm.socketServerGetInfo
- string comm.socketServerGetInfo()
- returns the IP and port of the Lua socket server

comm.socketServerGetIp
- string comm.socketServerGetIp()
- returns the IP address of the Lua socket server

comm.socketServerGetPort
- int? comm.socketServerGetPort()
- returns the port of the Lua socket server

comm.socketServerIsConnected
- bool comm.socketServerIsConnected()
- socketServerIsConnected

comm.socketServerResponse
- string comm.socketServerResponse()
- receives a message from the Socket server

comm.socketServerScreenShot
- string comm.socketServerScreenShot()
- sends a screenshot to the Socket server

comm.socketServerScreenShotResponse
- string comm.socketServerScreenShotResponse()
- sends a screenshot to the Socket server and retrieves the response

comm.socketServerSend
- int comm.socketServerSend(string sendstring )
- sends a string to the Socket server

comm.socketServerSendBytes
- int comm.socketServerSendBytes(nluatable bytearray)
- sends bytes to the Socket server

comm.socketServerSetIp
- void comm.socketServerSetIp(string ip)
- sets the IP address of the Lua socket server

comm.socketServerSetPort
- void comm.socketServerSetPort(int port)
- sets the port of the Lua socket server

comm.socketServerSetTimeout
- void comm.socketServerSetTimeout(int timeout)
- sets the timeout in milliseconds for receiving messages

comm.socketServerSuccessful
- bool comm.socketServerSuccessful()
- returns the status of the last Socket server action

## console
### A library to interact with the LUA console

console.clear
- void console.clear()
- clears the output box of the Lua Console window

console.getluafunctionslist
- string console.getluafunctionslist()
- returns a list of implemented functions

console.log
- void console.log(object[] outputs)
- Outputs the given object to the output box on the Lua Console dialog. Note: Can accept a LuaTable

console.write
- void console.write(object[] outputs)
- Outputs the given object to the output box on the Lua Console dialog. Note: Can accept a LuaTable

console.writeline
- void console.writeline(object[] outputs)
- Outputs the given object to the output box on the Lua Console dialog. Note: Can accept a LuaTable

## emu
### A library for interacting with the currently loaded emulator core

emu.disassemble
- object emu.disassemble(uint pc, [string name = ])
- Returns the disassembly object (disasm string and length int) for the given PC address. Uses System Bus domain if no domain name provided

emu.displayvsync
- void emu.displayvsync(bool enabled)
- Sets the display vsync property of the emulator

emu.frameadvance
- void emu.frameadvance()
- Signals to the emulator to resume emulation. Necessary for any lua script while loop or else the emulator will freeze!

emu.framecount
- int emu.framecount()
- Returns the current frame count

emu.getboardname
- string emu.getboardname()
- returns (if available) the board name of the loaded ROM

emu.getdisplaytype
- string emu.getdisplaytype()
- returns the display type (PAL vs NTSC) that the emulator is currently running in

emu.getluacore
- [deprecated] string emu.getluacore()
- returns the name of the Lua core currently in use

emu.getregister
- int emu.getregister(string name)
- returns the value of a cpu register or flag specified by name. For a complete list of possible registers or flags for a given core, use getregisters

emu.getregisters
- nluatable emu.getregisters()
- returns the complete set of available flags and registers for a given core

emu.getsystemid
- string emu.getsystemid()
- Returns the ID string of the current core loaded. Note: No ROM loaded will return the string NULL

emu.islagged
- bool emu.islagged()
- Returns whether or not the current frame is a lag frame

emu.lagcount
- int emu.lagcount()
- Returns the current lag count

emu.limitframerate
- void emu.limitframerate(bool enabled)
- sets the limit framerate property of the emulator

emu.minimizeframeskip
- void emu.minimizeframeskip(bool enabled)
- Sets the autominimizeframeskip value of the emulator

emu.setislagged
- void emu.setislagged([bool value = True])
- Sets the lag flag for the current frame. If no value is provided, it will default to true

emu.setlagcount
- void emu.setlagcount(int count)
- Sets the current lag count

emu.setregister
- void emu.setregister(string register, int value)
- sets the given register name to the given value

emu.setrenderplanes
- void emu.setrenderplanes(bool[] luaparam)
- Toggles the drawing of sprites and background planes. Set to false or nil to disable a pane, anything else will draw them

emu.totalexecutedcycles
- long emu.totalexecutedcycles()
- gets the total number of executed cpu cycles

emu.yield
- void emu.yield()
- allows a script to run while emulation is paused and interact with the gui/main window in realtime

## event
### A library for registering lua functions to emulator events.
All events support multiple registered methods.
All registered event methods can be named and return a Guid when registered

event.availableScopes
- nluatable event.availableScopes()
- Lists the available scopes that can be passed into memory events

event.onconsoleclose
- string event.onconsoleclose(nluafunc luaf, [string name = nil])
- Fires when the emulator console closes

event.onexit
- string event.onexit(nluafunc luaf, [string name = nil])
- Fires after the calling script has stopped

event.onframeend
- string event.onframeend(nluafunc luaf, [string name = nil])
- Calls the given lua function at the end of each frame, after all emulation and drawing has completed. Note: this is the default behavior of lua scripts

event.onframestart
- string event.onframestart(nluafunc luaf, [string name = nil])
- Calls the given lua function at the beginning of each frame before any emulation and drawing occurs

event.oninputpoll
- string event.oninputpoll(nluafunc luaf, [string name = nil])
- Calls the given lua function after each time the emulator core polls for input

event.onloadstate
- string event.onloadstate(nluafunc luaf, [string name = nil])
- Fires after a state is loaded. Receives a lua function name, and registers it to the event immediately following a successful savestate event

event.onmemoryexecute
- string event.onmemoryexecute(nluafunc luaf, uint address, [string name = nil], [string scope = nil])
- Fires after the given address is executed by the core

event.onmemoryexecuteany
- string event.onmemoryexecuteany(nluafunc luaf, [string name = nil], [string scope = nil])
- Fires after any address is executed by the core (CPU-intensive)

event.onmemoryread
- string event.onmemoryread(nluafunc luaf, [uint? address = nil], [string name = nil], [string scope = nil])
- Fires after the given address is read by the core. If no address is given, it will attach to every memory read

event.onmemorywrite
- string event.onmemorywrite(nluafunc luaf, [uint? address = nil], [string name = nil], [string scope = nil])
- Fires after the given address is written by the core. If no address is given, it will attach to every memory write

event.onsavestate
- string event.onsavestate(nluafunc luaf, [string name = nil])
- Fires after a state is saved

event.unregisterbyid
- bool event.unregisterbyid(string guid)
- Removes the registered function that matches the guid. If a function is found and remove the function will return true. If unable to find a match, the function will return false.

event.unregisterbyname
- bool event.unregisterbyname(string name)
- Removes the first registered function that matches Name. If a function is found and remove the function will return true. If unable to find a match, the function will return false.

## forms
### A library for creating and managing custom dialogs

forms.addclick
- void forms.addclick(int handle, nluafunc clickevent)
- adds the given lua function as a click event to the given control

forms.button
- int forms.button(int formhandle, string caption, nluafunc clickevent, [int? x = nil], [int? y = nil], [int? width = nil], [int? height = nil])
- Creates a button control on the given form. The caption property will be the text value on the button. clickEvent is the name of a Lua function that will be invoked when the button is clicked. x, and y are the optional location parameters for the position of the button within the given form. The function returns the handle of the created button. Width and Height are optional, if not specified they will be a default size

forms.checkbox
- int forms.checkbox(int formhandle, string caption, [int? x = nil], [int? y = nil])
- Creates a checkbox control on the given form. The caption property will be the text of the checkbox. x and y are the optional location parameters for the position of the checkbox within the form

forms.clear
- void forms.clear(int componenthandle, luacolor color)
- Clears the canvas

forms.clearclicks
- void forms.clearclicks(int handle)
- Removes all click events from the given widget at the specified handle

forms.clearImageCache
- void forms.clearImageCache(int componenthandle)
- clears the image cache that is built up by using gui.drawImage, also releases the file handle for cached images

forms.createcolor
- color forms.createcolor(int r, int g, int b, int a)
- Creates a color object useful with setproperty

forms.destroy
- bool forms.destroy(int handle)
- Closes and removes a Lua created form with the specified handle. If a dialog was found and removed true is returned, else false

forms.destroyall
- void forms.destroyall()
- Closes and removes all Lua created dialogs

forms.drawArc
- void forms.drawArc(int componenthandle, int x, int y, int width, int height, int startangle, int sweepangle, [luacolor line = nil])
- draws a Arc shape at the given coordinates and the given width and height

forms.drawAxis
- void forms.drawAxis(int componenthandle, int x, int y, int size, [luacolor color = nil])
- Draws an axis of the specified size at the coordinate pair.)

forms.drawBezier
- void forms.drawBezier(int componenthandle, nluatable points, luacolor color)
- Draws a Bezier curve using the table of coordinates provided in the given color

forms.drawBox
- void forms.drawBox(int componenthandle, int x, int y, int x2, int y2, [luacolor line = nil], [luacolor background = nil])
- Draws a rectangle on screen from x1/y1 to x2/y2. Same as drawRectangle except it receives two points intead of a point and width/height

forms.drawEllipse
- void forms.drawEllipse(int componenthandle, int x, int y, int width, int height, [luacolor line = nil], [luacolor background = nil])
- Draws an ellipse at the given coordinates and the given width and height. Line is the color of the ellipse. Background is the optional fill color

forms.drawIcon
- void forms.drawIcon(int componenthandle, string path, int x, int y, [int? width = nil], [int? height = nil])
- draws an Icon (.ico) file from the given path at the given coordinate. width and height are optional. If specified, it will resize the image accordingly

forms.drawImage
- void forms.drawImage(int componenthandle, string path, int x, int y, [int? width = nil], [int? height = nil], [bool cache = True])
- draws an image file from the given path at the given coordinate. width and height are optional. If specified, it will resize the image accordingly

forms.drawImageRegion
- void forms.drawImageRegion(int componenthandle, string path, int source_x, int source_y, int source_width, int source_height, int dest_x, int dest_y, [int? dest_width = nil], [int? dest_height = nil])
- draws a given region of an image file from the given path at the given coordinate, and optionally with the given size

forms.drawLine
- void forms.drawLine(int componenthandle, int x1, int y1, int x2, int y2, [luacolor color = nil])
- Draws a line from the first coordinate pair to the 2nd. Color is optional (if not specified it will be drawn black)

forms.drawPie
- void forms.drawPie(int componenthandle, int x, int y, int width, int height, int startangle, int sweepangle, [luacolor line = nil], [luacolor background = nil])
- draws a Pie shape at the given coordinates and the given width and height

forms.drawPixel
- void forms.drawPixel(int componenthandle, int x, int y, [luacolor color = nil])
- Draws a single pixel at the given coordinates in the given color. Color is optional (if not specified it will be drawn black)

forms.drawPolygon
- void forms.drawPolygon(int componenthandle, nluatable points, [int? x = nil], [int? y = nil], [luacolor line = nil], [luacolor background = nil])
- Draws a polygon using the table of coordinates specified in points. This should be a table of tables(each of size 2). If x or y is passed, the polygon will be translated by the passed coordinate pair. Line is the color of the polygon. Background is the optional fill color

forms.drawRectangle
- void forms.drawRectangle(int componenthandle, int x, int y, int width, int height, [luacolor line = nil], [luacolor background = nil])
- Draws a rectangle at the given coordinate and the given width and height. Line is the color of the box. Background is the optional fill color

forms.drawString
- void forms.drawString(int componenthandle, int x, int y, string message, [luacolor forecolor = nil], [luacolor backcolor = nil], [int? fontsize = nil], [string fontfamily = nil], [string fontstyle = nil], [string horizalign = nil], [string vertalign = nil])
- Alias of DrawText()

forms.drawText
- void forms.drawText(int componenthandle, int x, int y, string message, [luacolor forecolor = nil], [luacolor backcolor = nil], [int? fontsize = nil], [string fontfamily = nil], [string fontstyle = nil], [string horizalign = nil], [string vertalign = nil])
- Draws the given message at the given x,y coordinates and the given color. The default color is white. A fontfamily can be specified and is monospace generic if none is specified (font family options are the same as the .NET FontFamily class). The fontsize default is 12. The default font style is regular. Font style options are regular, bold, italic, strikethrough, underline. Horizontal alignment options are left (default), center, or right. Vertical alignment options are bottom (default), middle, or top. Alignment options specify which ends of the text will be drawn at the x and y coordinates.

forms.dropdown
- int forms.dropdown(int formhandle, nluatable items, [int? x = nil], [int? y = nil], [int? width = nil], [int? height = nil])
- Creates a dropdown (with a ComboBoxStyle of DropDownList) control on the given form. Dropdown items are passed via a lua table. Only the values will be pulled for the dropdown items, the keys are irrelevant. Items will be sorted alphabetically. x and y are the optional location parameters, and width and height are the optional size parameters.

forms.getMouseX
- int forms.getMouseX(int componenthandle)
- Returns an integer representation of the mouse X coordinate relative to the PictureBox.

forms.getMouseY
- int forms.getMouseY(int componenthandle)
- Returns an integer representation of the mouse Y coordinate relative to the PictureBox.

forms.getproperty
- string forms.getproperty(int handle, string property)
- returns a string representation of the value of a property of the widget at the given handle

forms.gettext
- string forms.gettext(int handle)
- Returns the text property of a given form or control

forms.ischecked
- bool forms.ischecked(int handle)
- Returns the given checkbox's checked property

forms.label
- int forms.label(int formhandle, string caption, [int? x = nil], [int? y = nil], [int? width = nil], [int? height = nil], [bool fixedwidth = False])
- Creates a label control on the given form. The caption property is the text of the label. x, and y are the optional location parameters for the position of the label within the given form. The function returns the handle of the created label. Width and Height are optional, if not specified they will be a default size.

forms.newform
- int forms.newform([int? width = nil], [int? height = nil], [string title = nil], [nluafunc onclose = nil])
- creates a new default dialog, if both width and height are specified it will create a dialog of the specified size. If title is specified it will be the caption of the dialog, else the dialog caption will be 'Lua Dialog'. The function will return an int representing the handle of the dialog created.

forms.openfile
- string forms.openfile([string filename = nil], [string initialdirectory = nil], [string filter = nil])
- Creates a standard openfile dialog with optional parameters for the filename, directory, and filter. The return value is the directory that the user picked. If they chose to cancel, it will return an empty string

forms.pictureBox
- int forms.pictureBox(int formhandle, [int? x = nil], [int? y = nil], [int? width = nil], [int? height = nil])
- Creates a new drawing area in the form. Optionally the location in the form as well as the size of the drawing area can be specified. Returns the handle the component can be refered to with.

forms.refresh
- void forms.refresh(int componenthandle)
- Redraws the canvas

forms.setDefaultBackgroundColor
- void forms.setDefaultBackgroundColor(int componenthandle, luacolor color)
- Sets the default background color to use in drawing methods, transparent by default

forms.setDefaultForegroundColor
- void forms.setDefaultForegroundColor(int componenthandle, luacolor color)
- Sets the default foreground color to use in drawing methods, white by default

forms.setDefaultTextBackground
- void forms.setDefaultTextBackground(int componenthandle, luacolor color)
- Sets the default backgroiund color to use in text drawing methods, half-transparent black by default

forms.setdropdownitems
- void forms.setdropdownitems(int handle, nluatable items, [bool alphabetize = True])
- Updates the item list of a dropdown menu. The optional third parameter toggles alphabetical sorting of items, pass false to skip sorting.

forms.setlocation
- void forms.setlocation(int handle, int x, int y)
- Sets the location of a control or form by passing in the handle of the created object

forms.setproperty
- void forms.setproperty(int handle, string property, object value)
- Attempts to set the given property of the widget with the given value. Note: not all properties will be able to be represented for the control to accept

forms.setsize
- void forms.setsize(int handle, int width, int height)
- TODO

forms.settext
- void forms.settext(int handle, string caption)
- Sets the text property of a control or form by passing in the handle of the created object

forms.textbox
- int forms.textbox(int formhandle, [string caption = nil], [int? width = nil], [int? height = nil], [string boxtype = nil], [int? x = nil], [int? y = nil], [bool multiline = False], [bool fixedwidth = False], [string scrollbars = nil])
- Creates a textbox control on the given form. The caption property will be the initial value of the textbox (default is empty). Width and Height are option, if not specified they will be a default size of 100, 20. Type is an optional property to restrict the textbox input. The available options are HEX, SIGNED, and UNSIGNED. Passing it null or any other value will set it to no restriction. x, and y are the optional location parameters for the position of the textbox within the given form. The function returns the handle of the created textbox. If true, the multiline will enable the standard winform multi-line property. If true, the fixedWidth options will create a fixed width font. Scrollbars is an optional property to specify which scrollbars to display. The available options are Vertical, Horizontal, Both, and None. Scrollbars are only shown on a multiline textbox

## gameinfo

gameinfo.getboardtype
- string gameinfo.getboardtype()
- returns identifying information about the 'mapper' or similar capability used for this game. empty if no such useful distinction can be drawn

gameinfo.getoptions
- nluatable gameinfo.getoptions()
- returns the game options for the currently loaded rom. Options vary per platform

gameinfo.getromhash
- string gameinfo.getromhash()
- returns the hash of the currently loaded rom, if a rom is loaded

gameinfo.getromname
- string gameinfo.getromname()
- returns the name of the currently loaded rom, if a rom is loaded

gameinfo.getstatus
- string gameinfo.getstatus()
- returns the game database status of the currently loaded rom. Statuses are for example: GoodDump, BadDump, Hack, Unknown, NotInDatabase

gameinfo.indatabase
- bool gameinfo.indatabase()
- returns whether or not the currently loaded rom is in the game database

gameinfo.isstatusbad
- bool gameinfo.isstatusbad()
- returns the currently loaded rom's game database status is considered 'bad'

## genesis
### Functions specific to GenesisHawk (functions may not run when an Genesis game is not loaded)

genesis.getlayer_bga
- bool genesis.getlayer_bga()
- Returns whether the bg layer A is displayed

genesis.getlayer_bgb
- bool genesis.getlayer_bgb()
- Returns whether the bg layer B is displayed

genesis.getlayer_bgw
- bool genesis.getlayer_bgw()
- Returns whether the bg layer W is displayed

genesis.setlayer_bga
- void genesis.setlayer_bga(bool value)
- Sets whether the bg layer A is displayed

genesis.setlayer_bgb
- void genesis.setlayer_bgb(bool value)
- Sets whether the bg layer B is displayed

genesis.setlayer_bgw
- void genesis.setlayer_bgw(bool value)
- Sets whether the bg layer W is displayed

## gui

gui.addmessage
- void gui.addmessage(string message)
- Adds a message to the OSD's message area

gui.clearGraphics
- void gui.clearGraphics([string surfacename = nil])
- clears all lua drawn graphics from the screen

gui.clearImageCache
- void gui.clearImageCache()
- clears the image cache that is built up by using gui.drawImage, also releases the file handle for cached images

gui.cleartext
- void gui.cleartext()
- clears all text created by gui.text()

gui.createcanvas
- nluatable gui.createcanvas(int width, int height, [int? x = nil], [int? y = nil])
- Creates a canvas of the given size and, if specified, the given coordinates.

gui.defaultBackground
- void gui.defaultBackground(luacolor color)
- Sets the default background color to use in drawing methods, transparent by default

gui.defaultForeground
- void gui.defaultForeground(luacolor color)
- Sets the default foreground color to use in drawing methods, white by default

gui.defaultPixelFont
- void gui.defaultPixelFont(string fontfamily)
- Sets the default font to use in gui.pixelText(). Two font families are available, "fceux" and "gens" (or "0" and "1" respectively), "gens" is used by default

gui.defaultTextBackground
- void gui.defaultTextBackground(luacolor color)
- Sets the default background color to use in text drawing methods, half-transparent black by default

gui.drawAxis
- void gui.drawAxis(int x, int y, int size, [luacolor color = nil], [string surfacename = nil])
- Draws an axis of the specified size at the coordinate pair.)

gui.drawBezier
- void gui.drawBezier(nluatable points, luacolor color, [string surfacename = nil])
- Draws a Bezier curve using the table of coordinates provided in the given color

gui.drawBox
- void gui.drawBox(int x, int y, int x2, int y2, [luacolor line = nil], [luacolor background = nil], [string surfacename = nil])
- Draws a rectangle on screen from x1/y1 to x2/y2. Same as drawRectangle except it receives two points intead of a point and width/height

gui.drawEllipse
- void gui.drawEllipse(int x, int y, int width, int height, [luacolor line = nil], [luacolor background = nil], [string surfacename = nil])
- Draws an ellipse at the given coordinates and the given width and height. Line is the color of the ellipse. Background is the optional fill color

gui.DrawFinish
- [deprecated] void gui.DrawFinish()
- Finishes drawing to the current lua surface and causes it to get displayed.

gui.drawIcon
- void gui.drawIcon(string path, int x, int y, [int? width = nil], [int? height = nil], [string surfacename = nil])
- draws an Icon (.ico) file from the given path at the given coordinate. width and height are optional. If specified, it will resize the image accordingly

gui.drawImage
- void gui.drawImage(string path, int x, int y, [int? width = nil], [int? height = nil], [bool cache = True], [string surfacename = nil])
- draws an image file from the given path at the given coordinate. width and height are optional. If specified, it will resize the image accordingly

gui.drawImageRegion
- void gui.drawImageRegion(string path, int source_x, int source_y, int source_width, int source_height, int dest_x, int dest_y, [int? dest_width = nil], [int? dest_height = nil], [string surfacename = nil])
- draws a given region of an image file from the given path at the given coordinate, and optionally with the given size

gui.drawLine
- void gui.drawLine(int x1, int y1, int x2, int y2, [luacolor color = nil], [string surfacename = nil])
- Draws a line from the first coordinate pair to the 2nd. Color is optional (if not specified it will be drawn black)

gui.DrawNew
- [deprecated] void gui.DrawNew(string name, [bool? clear = True])
- Changes drawing target to the specified lua surface name. This may clobber any previous drawing to this surface (pass false if you don't want it to)

gui.drawPie
- void gui.drawPie(int x, int y, int width, int height, int startangle, int sweepangle, [luacolor line = nil], [luacolor background = nil], [string surfacename = nil])
- draws a Pie shape at the given coordinates and the given width and height

gui.drawPixel
- void gui.drawPixel(int x, int y, [luacolor color = nil], [string surfacename = nil])
- Draws a single pixel at the given coordinates in the given color. Color is optional (if not specified it will be drawn black)

gui.drawPolygon
- void gui.drawPolygon(nluatable points, [int? offsetx = nil], [int? offsety = nil], [luacolor line = nil], [luacolor background = nil], [string surfacename = nil])
- Draws a polygon using the table of coordinates specified in points. This should be a table of tables(each of size 2). If x or y is passed, the polygon will be translated by the passed coordinate pair. Line is the color of the polygon. Background is the optional fill color

gui.drawRectangle
- void gui.drawRectangle(int x, int y, int width, int height, [luacolor line = nil], [luacolor background = nil], [string surfacename = nil])
- Draws a rectangle at the given coordinate and the given width and height. Line is the color of the box. Background is the optional fill color

gui.drawString
- void gui.drawString(int x, int y, string message, [luacolor forecolor = nil], [luacolor backcolor = nil], [int? fontsize = nil], [string fontfamily = nil], [string fontstyle = nil], [string horizalign = nil], [string vertalign = nil], [string surfacename = nil])
- Alias of gui.drawText()

gui.drawText
- void gui.drawText(int x, int y, string message, [luacolor forecolor = nil], [luacolor backcolor = nil], [int? fontsize = nil], [string fontfamily = nil], [string fontstyle = nil], [string horizalign = nil], [string vertalign = nil], [string surfacename = nil])
- Draws the given message in the emulator screen space (like all draw functions) at the given x,y coordinates and the given color. The default color is white. A fontfamily can be specified and is monospace generic if none is specified (font family options are the same as the .NET FontFamily class). The fontsize default is 12. The default font style is regular. Font style options are regular, bold, italic, strikethrough, underline. Horizontal alignment options are left (default), center, or right. Vertical alignment options are bottom (default), middle, or top. Alignment options specify which ends of the text will be drawn at the x and y coordinates. For pixel-perfect font look, make sure to disable aspect ratio correction.

gui.pixelText
- void gui.pixelText(int x, int y, string message, [luacolor forecolor = nil], [luacolor backcolor = nil], [string fontfamily = nil], [string surfacename = nil])
- Draws the given message in the emulator screen space (like all draw functions) at the given x,y coordinates and the given color. The default color is white. Two font families are available, "fceux" and "gens" (or "0" and "1" respectively), both are monospace and have the same size as in the emulators they've been taken from. If no font family is specified, it uses "gens" font, unless that's overridden via gui.defaultPixelFont()

gui.text
- void gui.text(int x, int y, string message, [luacolor forecolor = nil], [string anchor = nil])
- Displays the given text on the screen at the given coordinates. Optional Foreground color. The optional anchor flag anchors the text to one of the four corners. Anchor flag parameters: topleft, topright, bottomleft, bottomright

gui.use_surface
- void gui.use_surface(string surfacename)
- Stores the name of a surface to draw on, so you don't need to pass it to every draw function. The default is "emucore", and the other valid value is "client".

## input

input.get
- nluatable input.get()
- Returns a lua table of all the buttons the user is currently pressing on their keyboard and gamepads. All buttons that are pressed have their key values set to true; all others remain nil.

input.getmouse
- nluatable input.getmouse()
- Returns a lua table of the mouse X/Y coordinates and button states. Table keys are X, Y, Left, Middle, Right, XButton1, XButton2, Wheel.

## joypad

joypad.get
- nluatable joypad.get([int? controller = nil])
- returns a lua table of the controller buttons pressed. If supplied, it will only return a table of buttons for the given controller

joypad.getimmediate
- nluatable joypad.getimmediate([int? controller = nil])
- returns a lua table of any controller buttons currently pressed by the user

joypad.getwithmovie
- nluatable joypad.getwithmovie([int? controller = nil])
- returns a lua table of the controller buttons pressed, including ones pressed by the current movie. If supplied, it will only return a table of buttons for the given controller

joypad.set
- void joypad.set(nluatable buttons, [int? controller = nil])
- sets the given buttons to their provided values for the current frame

joypad.setanalog
- void joypad.setanalog(nluatable controls, [object controller = nil])
- sets the given analog controls to their provided values for the current frame. Note that unlike set() there is only the logic of overriding with the given value.

joypad.setfrommnemonicstr
- void joypad.setfrommnemonicstr(string inputlogentry)
- sets the given buttons to their provided values for the current frame, string will be interpreted the same way an entry from a movie input log would be

## LuaCanvas
### Represents a canvas object returned by the gui.createcanvas() method

LuaCanvas.Clear
- void LuaCanvas.Clear(luacolor color)
- Clears the canvas

LuaCanvas.ClearImageCache
- void LuaCanvas.ClearImageCache()
- clears the image cache that is built up by using gui.drawImage, also releases the file handle for cached images

LuaCanvas.DrawArc
- void LuaCanvas.DrawArc(int x, int y, int width, int height, int startangle, int sweepangle, [luacolor line = nil])
- draws a Arc shape at the given coordinates and the given width and height

LuaCanvas.DrawAxis
- void LuaCanvas.DrawAxis(int x, int y, int size, [luacolor color = nil])
- Draws an axis of the specified size at the coordinate pair.)

LuaCanvas.DrawBezier
- void LuaCanvas.DrawBezier(nluatable points, luacolor color)
- Draws a Bezier curve using the table of coordinates provided in the given color

LuaCanvas.DrawBox
- void LuaCanvas.DrawBox(int x, int y, int x2, int y2, [luacolor line = nil], [luacolor background = nil])
- Draws a rectangle on screen from x1/y1 to x2/y2. Same as drawRectangle except it receives two points intead of a point and width/height

LuaCanvas.DrawEllipse
- void LuaCanvas.DrawEllipse(int x, int y, int width, int height, [luacolor line = nil], [luacolor background = nil])
- Draws an ellipse at the given coordinates and the given width and height. Line is the color of the ellipse. Background is the optional fill color

LuaCanvas.DrawIcon
- void LuaCanvas.DrawIcon(string path, int x, int y, [int? width = nil], [int? height = nil])
- draws an Icon (.ico) file from the given path at the given coordinate. width and height are optional. If specified, it will resize the image accordingly

LuaCanvas.DrawImage
- void LuaCanvas.DrawImage(string path, int x, int y, [int? width = nil], [int? height = nil], [bool cache = True])
- draws an image file from the given path at the given coordinate. width and height are optional. If specified, it will resize the image accordingly

LuaCanvas.DrawImageRegion
- void LuaCanvas.DrawImageRegion(string path, int sourcex, int sourcey, int sourcewidth, int sourceheight, int destx, int desty, [int? destwidth = nil], [int? destheight = nil])
- draws a given region of an image file from the given path at the given coordinate, and optionally with the given size

LuaCanvas.DrawLine
- void LuaCanvas.DrawLine(int x1, int y1, int x2, int y2, [luacolor color = nil])
- Draws a line from the first coordinate pair to the 2nd. Color is optional (if not specified it will be drawn black)

LuaCanvas.DrawPie
- void LuaCanvas.DrawPie(int x, int y, int width, int height, int startangle, int sweepangle, [luacolor line = nil], [luacolor background = nil])
- draws a Pie shape at the given coordinates and the given width and height

LuaCanvas.DrawPixel
- void LuaCanvas.DrawPixel(int x, int y, [luacolor color = nil])
- Draws a single pixel at the given coordinates in the given color. Color is optional (if not specified it will be drawn black)

LuaCanvas.DrawPolygon
- void LuaCanvas.DrawPolygon(nluatable points, [int? x = nil], [int? y = nil], [luacolor line = nil], [luacolor background = nil])
- Draws a polygon using the table of coordinates specified in points. This should be a table of tables(each of size 2). Line is the color of the polygon. Background is the optional fill color

LuaCanvas.DrawRectangle
- void LuaCanvas.DrawRectangle(int x, int y, int width, int height, [luacolor line = nil], [luacolor background = nil])
- Draws a rectangle at the given coordinate and the given width and height. Line is the color of the box. Background is the optional fill color

LuaCanvas.DrawString
- void LuaCanvas.DrawString(int x, int y, string message, [luacolor forecolor = nil], [luacolor backcolor = nil], [int? fontsize = nil], [string fontfamily = nil], [string fontstyle = nil], [string horizontalalign = nil], [string verticalalign = nil])
- Alias of DrawText()

LuaCanvas.DrawText
- void LuaCanvas.DrawText(int x, int y, string message, [luacolor forecolor = nil], [luacolor backcolor = nil], [int? fontsize = nil], [string fontfamily = nil], [string fontstyle = nil], [string horizontalalign = nil], [string verticalalign = nil])
- Draws the given message at the given x,y coordinates and the given color. The default color is white. A fontfamily can be specified and is monospace generic if none is specified (font family options are the same as the .NET FontFamily class). The fontsize default is 12. The default font style is regular. Font style options are regular, bold, italic, strikethrough, underline. Horizontal alignment options are left (default), center, or right. Vertical alignment options are bottom (default), middle, or top. Alignment options specify which ends of the text will be drawn at the x and y coordinates.

LuaCanvas.GetMouseX
- int LuaCanvas.GetMouseX()
- Returns an integer representation of the mouse X coordinate relative to the canvas window.

LuaCanvas.GetMouseY
- int LuaCanvas.GetMouseY()
- Returns an integer representation of the mouse Y coordinate relative to the canvas window.

LuaCanvas.Refresh
- void LuaCanvas.Refresh()
- Redraws the canvas

LuaCanvas.save_image_to_disk
void LuaCanvas.save_image_to_disk(string path)
Saves everything that's been drawn to a .png file at the given path. Relative paths are relative to the path set for "Screenshots" for the current system.

LuaCanvas.SetDefaultBackgroundColor
- void LuaCanvas.SetDefaultBackgroundColor(luacolor color)
- Sets the default background color to use in drawing methods, transparent by default

LuaCanvas.SetDefaultForegroundColor
- void LuaCanvas.SetDefaultForegroundColor(luacolor color)
- Sets the default foreground color to use in drawing methods, white by default

LuaCanvas.SetDefaultTextBackground
- void LuaCanvas.SetDefaultTextBackground(luacolor color)
- Sets the default background color to use in text drawing methods, half-transparent black by default

LuaCanvas.SetLocation
- void LuaCanvas.SetLocation(int x, int y)
- Sets the location of the canvas window

LuaCanvas.SetTitle
- void LuaCanvas.SetTitle(string title)
- Sets the canvas window title

## mainmemory
### Main memory library reads and writes from the Main memory domain (the default memory domain set by any given core)

mainmemory.getcurrentmemorydomainsize
- uint mainmemory.getcurrentmemorydomainsize()
- Returns the number of bytes of the domain defined as main memory

mainmemory.getname
- string mainmemory.getname()
- returns the name of the domain defined as main memory for the given core

mainmemory.read_bytes_as_array
- nluatable mainmemory.read_bytes_as_array(long addr, int length)
- Reads length bytes starting at addr into an array-like table (1-indexed).

mainmemory.read_bytes_as_dict
- nluatable mainmemory.read_bytes_as_dict(long addr, int length)
- Reads length bytes starting at addr into a dict-like table (where the keys are the addresses, relative to the start of the main memory).

mainmemory.read_s16_be
- int mainmemory.read_s16_be(long addr)
- read signed 2 byte value, big endian

mainmemory.read_s16_le
- int mainmemory.read_s16_le(long addr)
- read signed 2 byte value, little endian

mainmemory.read_s24_be
- int mainmemory.read_s24_be(long addr)
- read signed 24 bit value, big endian

mainmemory.read_s24_le
- int mainmemory.read_s24_le(long addr)
- read signed 24 bit value, little endian

mainmemory.read_s32_be
- int mainmemory.read_s32_be(long addr)
- read signed 4 byte value, big endian

mainmemory.read_s32_le
- int mainmemory.read_s32_le(long addr)
- read signed 4 byte value, little endian

mainmemory.read_s8
- int mainmemory.read_s8(long addr)
- read signed byte

mainmemory.read_u16_be
- uint mainmemory.read_u16_be(long addr)
- read unsigned 2 byte value, big endian

mainmemory.read_u16_le
- uint mainmemory.read_u16_le(long addr)
- read unsigned 2 byte value, little endian

mainmemory.read_u24_be
- uint mainmemory.read_u24_be(long addr)
- read unsigned 24 bit value, big endian

mainmemory.read_u24_le
- uint mainmemory.read_u24_le(long addr)
- read unsigned 24 bit value, little endian

mainmemory.read_u32_be
- uint mainmemory.read_u32_be(long addr)
- read unsigned 4 byte value, big endian

mainmemory.read_u32_le
- uint mainmemory.read_u32_le(long addr)
- read unsigned 4 byte value, little endian

mainmemory.read_u8
- uint mainmemory.read_u8(long addr)
- read unsigned byte

mainmemory.readbyte
- uint mainmemory.readbyte(long addr)
- gets the value from the given address as an unsigned byte

mainmemory.readbyterange
- [deprecated] nluatable mainmemory.readbyterange(long addr, int length)
- Reads the address range that starts from address, and is length long. Returns a zero-indexed table containing the read values (an array of bytes.)

mainmemory.readfloat
- single mainmemory.readfloat(long addr, bool bigendian)
- Reads the given address as a 32-bit float value from the main memory domain with th e given endian

mainmemory.write_bytes_as_array
- void mainmemory.write_bytes_as_array(long addr, nluatable bytes)
- Writes sequential bytes starting at addr.

mainmemory.write_bytes_as_dict
- void mainmemory.write_bytes_as_dict(nluatable addrmap)
- Writes bytes at arbitrary addresses (the keys of the given table are the addresses, relative to the start of the main memory).

mainmemory.write_s16_be
- void mainmemory.write_s16_be(long addr, int value)
- write signed 2 byte value, big endian

mainmemory.write_s16_le
- void mainmemory.write_s16_le(long addr, int value)
- write signed 2 byte value, little endian

mainmemory.write_s24_be
- void mainmemory.write_s24_be(long addr, int value)
- write signed 24 bit value, big endian

mainmemory.write_s24_le
- void mainmemory.write_s24_le(long addr, int value)
- write signed 24 bit value, little endian

mainmemory.write_s32_be
- void mainmemory.write_s32_be(long addr, int value)
- write signed 4 byte value, big endian

mainmemory.write_s32_le
- void mainmemory.write_s32_le(long addr, int value)
- write signed 4 byte value, little endian

mainmemory.write_s8
- void mainmemory.write_s8(long addr, uint value)
- write signed byte

mainmemory.write_u16_be
- void mainmemory.write_u16_be(long addr, uint value)
- write unsigned 2 byte value, big endian

mainmemory.write_u16_le
- void mainmemory.write_u16_le(long addr, uint value)
- write unsigned 2 byte value, little endian

mainmemory.write_u24_be
- void mainmemory.write_u24_be(long addr, uint value)
- write unsigned 24 bit value, big endian

mainmemory.write_u24_le
- void mainmemory.write_u24_le(long addr, uint value)
- write unsigned 24 bit value, little endian

mainmemory.write_u32_be
- void mainmemory.write_u32_be(long addr, uint value)
- write unsigned 4 byte value, big endian

mainmemory.write_u32_le
- void mainmemory.write_u32_le(long addr, uint value)
- write unsigned 4 byte value, little endian

mainmemory.write_u8
- void mainmemory.write_u8(long addr, uint value)
- write unsigned byte

mainmemory.writebyte
- void mainmemory.writebyte(long addr, uint value)
- Writes the given value to the given address as an unsigned byte

mainmemory.writebyterange
- [deprecated] void mainmemory.writebyterange(nluatable memoryblock)
- Writes the given values to the given addresses as unsigned bytes

mainmemory.writefloat
- void mainmemory.writefloat(long addr, double value, bool bigendian)
- Writes the given 32-bit float value to the given address and endian

## memory
### These functions behavior identically to the mainmemory functions but the user can set the memory domain to read and write from. The default domain is the system bus. Use getcurrentmemorydomain(), and usememorydomain() to control which domain is used. Each core has its own set of valid memory domains. Use getmemorydomainlist() to get a list of memory domains for the current core loaded.

memory.getcurrentmemorydomain
- string memory.getcurrentmemorydomain()
- Returns a string name of the current memory domain selected by Lua. The default is Main memory

memory.getcurrentmemorydomainsize
- uint memory.getcurrentmemorydomainsize()
- Returns the number of bytes of the current memory domain selected by Lua. The default is Main memory

memory.getmemorydomainlist
- nluatable memory.getmemorydomainlist()
- Returns a string of the memory domains for the loaded platform core. List will be a single string delimited by line feeds

memory.getmemorydomainsize
- uint memory.getmemorydomainsize([string name = ])
- Returns the number of bytes of the specified memory domain. If no domain is specified, or the specified domain doesn't exist, returns the current domain size

memory.hash_region
- string memory.hash_region(long addr, int count, [string domain = nil])
- Returns a hash as a string of a region of memory, starting from addr, through count bytes. If the domain is unspecified, it uses the current region.

memory.read_bytes_as_array
- nluatable memory.read_bytes_as_array(long addr, int length, [string domain = nil])
- Reads length bytes starting at addr into an array-like table (1-indexed).

memory.read_bytes_as_dict
- nluatable memory.read_bytes_as_dict(long addr, int length, [string domain = nil])
- Reads length bytes starting at addr into a dict-like table (where the keys are the addresses, relative to the start of the domain).

memory.read_s16_be
- int memory.read_s16_be(long addr, [string domain = nil])
- read signed 2 byte value, big endian

memory.read_s16_le
- int memory.read_s16_le(long addr, [string domain = nil])
- read signed 2 byte value, little endian

memory.read_s24_be
- int memory.read_s24_be(long addr, [string domain = nil])
- read signed 24 bit value, big endian

memory.read_s24_le
- int memory.read_s24_le(long addr, [string domain = nil])
- read signed 24 bit value, little endian

memory.read_s32_be
- int memory.read_s32_be(long addr, [string domain = nil])
- read signed 4 byte value, big endian

memory.read_s32_le
- int memory.read_s32_le(long addr, [string domain = nil])
- read signed 4 byte value, little endian

memory.read_s8
- int memory.read_s8(long addr, [string domain = nil])
- read signed byte

memory.read_u16_be
- uint memory.read_u16_be(long addr, [string domain = nil])
- read unsigned 2 byte value, big endian

memory.read_u16_le
- uint memory.read_u16_le(long addr, [string domain = nil])
- read unsigned 2 byte value, little endian

memory.read_u24_be
- uint memory.read_u24_be(long addr, [string domain = nil])
- read unsigned 24 bit value, big endian

memory.read_u24_le
- uint memory.read_u24_le(long addr, [string domain = nil])
- read unsigned 24 bit value, little endian

memory.read_u32_be
- uint memory.read_u32_be(long addr, [string domain = nil])
- read unsigned 4 byte value, big endian

memory.read_u32_le
- uint memory.read_u32_le(long addr, [string domain = nil])
- read unsigned 4 byte value, little endian

memory.read_u8
- uint memory.read_u8(long addr, [string domain = nil])
- read unsigned byte

memory.readbyte
- uint memory.readbyte(long addr, [string domain = nil])
- gets the value from the given address as an unsigned byte

memory.readbyterange
- [deprecated] nluatable memory.readbyterange(long addr, int length, [string domain = nil])
- Reads the address range that starts from address, and is length long. Returns a zero-indexed table containing the read values (an array of bytes.)

memory.readfloat
- single memory.readfloat(long addr, bool bigendian, [string domain = nil])
- Reads the given address as a 32-bit float value from the main memory domain with th e given endian

memory.usememorydomain
- bool memory.usememorydomain(string domain)
- Attempts to set the current memory domain to the given domain. If the name does not match a valid memory domain, the function returns false, else it returns true

memory.write_bytes_as_array
- void memory.write_bytes_as_array(long addr, nluatable bytes, [string domain = nil])
- Writes sequential bytes starting at addr.

memory.write_bytes_as_dict
- void memory.write_bytes_as_dict(nluatable addrmap, [string domain = nil])
- Writes bytes at arbitrary addresses (the keys of the given table are the addresses, relative to the start of the domain).

memory.write_s16_be
- void memory.write_s16_be(long addr, int value, [string domain = nil])
- write signed 2 byte value, big endian

memory.write_s16_le
- void memory.write_s16_le(long addr, int value, [string domain = nil])
- write signed 2 byte value, little endian

memory.write_s24_be
- void memory.write_s24_be(long addr, int value, [string domain = nil])
- write signed 24 bit value, big endian

memory.write_s24_le
- void memory.write_s24_le(long addr, int value, [string domain = nil])
- write signed 24 bit value, little endian

memory.write_s32_be
- void memory.write_s32_be(long addr, int value, [string domain = nil])
- write signed 4 byte value, big endian

memory.write_s32_le
- void memory.write_s32_le(long addr, int value, [string domain = nil])
- write signed 4 byte value, little endian

memory.write_s8
- void memory.write_s8(long addr, uint value, [string domain = nil])
- write signed byte

memory.write_u16_be
- void memory.write_u16_be(long addr, uint value, [string domain = nil])
- write unsigned 2 byte value, big endian

memory.write_u16_le
- void memory.write_u16_le(long addr, uint value, [string domain = nil])
- write unsigned 2 byte value, little endian

memory.write_u24_be
- void memory.write_u24_be(long addr, uint value, [string domain = nil])
- write unsigned 24 bit value, big endian

memory.write_u24_le
- void memory.write_u24_le(long addr, uint value, [string domain = nil])
- write unsigned 24 bit value, little endian

memory.write_u32_be
- void memory.write_u32_be(long addr, uint value, [string domain = nil])
- write unsigned 4 byte value, big endian

memory.write_u32_le
- void memory.write_u32_le(long addr, uint value, [string domain = nil])
- write unsigned 4 byte value, little endian

memory.write_u8
- void memory.write_u8(long addr, uint value, [string domain = nil])
- write unsigned byte

memory.writebyte
- void memory.writebyte(long addr, uint value, [string domain = nil])
- Writes the given value to the given address as an unsigned byte

memory.writebyterange
- [deprecated] void memory.writebyterange(nluatable memoryblock, [string domain = nil])
- Writes the given values to the given addresses as unsigned bytes

memory.writefloat
- void memory.writefloat(long addr, double value, bool bigendian, [string domain = nil])
- Writes the given 32-bit float value to the given address and endian

## memorysavestate

memorysavestate.clearstatesfrommemory
- void memorysavestate.clearstatesfrommemory()
- clears all savestates stored in memory

memorysavestate.loadcorestate
- void memorysavestate.loadcorestate(string identifier)
- loads an in memory state with the given identifier

memorysavestate.removestate
- void memorysavestate.removestate(string identifier)
- removes the savestate with the given identifier from memory

memorysavestate.savecorestate
- string memorysavestate.savecorestate()
- creates a core savestate and stores it in memory. Note: a core savestate is only the raw data from the core, and not extras such as movie input logs, or framebuffers. Returns a unique identifer for the savestate

## movie

movie.filename
- string movie.filename()
- Returns the file name including path of the currently loaded movie

movie.getcomments
- nluatable movie.getcomments()
- If a movie is active, will return the movie comments as a lua table

movie.getfps
- double movie.getfps()
- If a movie is loaded, gets the frames per second used by the movie to determine the movie length time

movie.getheader
- nluatable movie.getheader()
- If a movie is active, will return the movie header as a lua table

movie.getinput
- nluatable movie.getinput(int frame, [int? controller = nil])
- Returns a table of buttons pressed on a given frame of the loaded movie

movie.getinputasmnemonic
- string movie.getinputasmnemonic(int frame)
- Returns the input of a given frame of the loaded movie in a raw inputlog string

movie.getreadonly
- bool movie.getreadonly()
- Returns true if the movie is in read-only mode, false if in read+write

movie.getrerecordcount
- ulong movie.getrerecordcount()
- Gets the rerecord count of the current movie.

movie.getrerecordcounting
- bool movie.getrerecordcounting()
- Returns whether or not the current movie is incrementing rerecords on loadstate

movie.getsubtitles
- nluatable movie.getsubtitles()
- If a movie is active, will return the movie subtitles as a lua table

movie.isloaded
- bool movie.isloaded()
- Returns true if a movie is loaded in memory (play, record, or finished modes), false if not (inactive mode)

movie.length
- double movie.length()
- Returns the total number of frames of the loaded movie

movie.mode
- string movie.mode()
- Returns the mode of the current movie. Possible modes: "PLAY", "RECORD", "FINISHED", "INACTIVE"

movie.save
- void movie.save([string filename = ])
- Saves the current movie to the disc. If the filename is provided (no extension or path needed), the movie is saved under the specified name to the current movie directory. The filename may contain a subdirectory, it will be created if it doesn't exist. Existing files won't get overwritten.

movie.setreadonly
- void movie.setreadonly(bool readonly)
- Sets the read-only state to the given value. true for read only, false for read+write

movie.setrerecordcount
- void movie.setrerecordcount(double count)
- Sets the rerecord count of the current movie.

movie.setrerecordcounting
- void movie.setrerecordcounting(bool counting)
- Sets whether or not the current movie will increment the rerecord counter on loadstate

movie.startsfromsaveram
- bool movie.startsfromsaveram()
- Returns whether or not the movie is a saveram-anchored movie

movie.startsfromsavestate
- bool movie.startsfromsavestate()
- Returns whether or not the movie is a savestate-anchored movie

movie.stop
- void movie.stop()
- Stops the current movie

## nds
### Functions specific to NDSHawk (functions may not run when an NDS game is not loaded)

nds.getaccurateaudiobitrate
- bool nds.getaccurateaudiobitrate()
- Returns whether the audio bitrate is in accurate mode

nds.getscreengap
- int nds.getscreengap()
- Returns the gap between the screens

nds.getscreeninvert
- bool nds.getscreeninvert()
- Returns whether screens are inverted

nds.getscreenlayout
- string nds.getscreenlayout()
- Returns which screen layout is active

nds.getscreenrotation
- string nds.getscreenrotation()
- Returns how screens are rotated

nds.setaccurateaudiobitrate
- void nds.setaccurateaudiobitrate(bool value)
- Sets whether the audio bitrate is in accurate mode

nds.setscreengap
- void nds.setscreengap(int value)
- Sets the gap between the screens

nds.setscreeninvert
- void nds.setscreeninvert(bool value)
- Sets whether screens are inverted

nds.setscreenlayout
- void nds.setscreenlayout(string value)
- Sets which screen layout is active

nds.setscreenrotation
- void nds.setscreenrotation(string value)
- Sets how screens are rotated

## nes
### Functions related specifically to Nes Cores

nes.getallowmorethaneightsprites
- bool nes.getallowmorethaneightsprites()
- Gets the NES setting 'Allow more than 8 sprites per scanline' value

nes.getbottomscanline
- int nes.getbottomscanline([bool pal = False])
- Gets the current value for the bottom scanline value

nes.getclipleftandright
- bool nes.getclipleftandright()
- Gets the current value for the Clip Left and Right sides option

nes.getdispbackground
- bool nes.getdispbackground()
- Indicates whether or not the bg layer is being displayed

nes.getdispsprites
- bool nes.getdispsprites()
- Indicates whether or not sprites are being displayed

nes.gettopscanline
- int nes.gettopscanline([bool pal = False])
- Gets the current value for the top scanline value

nes.setallowmorethaneightsprites
- void nes.setallowmorethaneightsprites(bool allow)
- Sets the NES setting 'Allow more than 8 sprites per scanline'

nes.setclipleftandright
- void nes.setclipleftandright(bool leftandright)
- Sets the Clip Left and Right sides option

nes.setdispbackground
- void nes.setdispbackground(bool show)
- Sets whether or not the background layer will be displayed

nes.setdispsprites
- void nes.setdispsprites(bool show)
- Sets whether or not sprites will be displayed

nes.setscanlines
- void nes.setscanlines(int top, int bottom, [bool pal = False])
- sets the top and bottom scanlines to be drawn (same values as in the graphics options dialog). Top must be in the range of 0 to 127, bottom must be between 128 and 239. Not supported in the Quick Nes core

## savestate

savestate.load
- void savestate.load(string path, [bool suppressosd = False])
- Loads a savestate with the given path. If EmuHawk is deferring quicksaves, to TAStudio for example, that form will do what it likes (and the path is ignored).

savestate.loadslot
- void savestate.loadslot(int slotnum, [bool suppressosd = False])
- Loads the savestate at the given slot number (must be an integer between 0 and 9). If EmuHawk is deferring quicksaves, to TAStudio for example, that form will do what it likes with the slot number.

savestate.save
- void savestate.save(string path, [bool suppressosd = False])
- Saves a state at the given path. If EmuHawk is deferring quicksaves, to TAStudio for example, that form will do what it likes (and the path is ignored).

savestate.saveslot
- void savestate.saveslot(int slotnum, [bool suppressosd = False])
- Saves a state at the given save slot (must be an integer between 0 and 9). If EmuHawk is deferring quicksaves, to TAStudio for example, that form will do what it likes with the slot number.

## snes
### Functions specific to SNESHawk (functions may not run when an SNES game is not loaded)

snes.getlayer_bg_1
- bool snes.getlayer_bg_1()
- Returns whether the bg 1 layer is displayed

snes.getlayer_bg_2
- bool snes.getlayer_bg_2()
- Returns whether the bg 2 layer is displayed

snes.getlayer_bg_3
- bool snes.getlayer_bg_3()
- Returns whether the bg 3 layer is displayed

snes.getlayer_bg_4
- bool snes.getlayer_bg_4()
- Returns whether the bg 4 layer is displayed

snes.getlayer_obj_1
- bool snes.getlayer_obj_1()
- Returns whether the obj 1 layer is displayed

snes.getlayer_obj_2
- bool snes.getlayer_obj_2()
- Returns whether the obj 2 layer is displayed

snes.getlayer_obj_3
- bool snes.getlayer_obj_3()
- Returns whether the obj 3 layer is displayed

snes.getlayer_obj_4
- bool snes.getlayer_obj_4()
- Returns whether the obj 4 layer is displayed

snes.setlayer_bg_1
- void snes.setlayer_bg_1(bool value)
- Sets whether the bg 1 layer is displayed

snes.setlayer_bg_2
- void snes.setlayer_bg_2(bool value)
- Sets whether the bg 2 layer is displayed

snes.setlayer_bg_3
- void snes.setlayer_bg_3(bool value)
- Sets whether the bg 3 layer is displayed

snes.setlayer_bg_4
- void snes.setlayer_bg_4(bool value)
- Sets whether the bg 4 layer is displayed

snes.setlayer_obj_1
- void snes.setlayer_obj_1(bool value)
- Sets whether the obj 1 layer is displayed

snes.setlayer_obj_2
- void snes.setlayer_obj_2(bool value)
- Sets whether the obj 2 layer is displayed

snes.setlayer_obj_3
- void snes.setlayer_obj_3(bool value)
- Sets whether the obj 3 layer is displayed

snes.setlayer_obj_4
- void snes.setlayer_obj_4(bool value)
- Sets whether the obj 4 layer is displayed

## sqlite
### A library for performing SQLite operations.

SQL.createdatabase
- string SQL.createdatabase(string name)
- Creates a SQLite Database. Name should end with .db

SQL.opendatabase
- string SQL.opendatabase(string name)
- Opens a SQLite database. Name should end with .db

SQL.readcommand
- object SQL.readcommand([string query = ])
- Run a SQLite read command which includes Select. Returns all rows into a LuaTable.Ex: select * from rewards

SQL.writecommand
- string SQL.writecommand([string query = ])
- Runs a SQLite write command which includes CREATE,INSERT, UPDATE. Ex: create TABLE rewards (ID integer PRIMARY KEY, action VARCHAR(20))

## tastudio
### A library for manipulating the Tastudio dialog of the EmuHawk client

tastudio.addcolumn
- void tastudio.addcolumn(string name, string text, int width)
-
tastudio.applyinputchanges
- void tastudio.applyinputchanges()
-
tastudio.clearinputchanges
- void tastudio.clearinputchanges()
-
tastudio.engaged
- bool tastudio.engaged()
- returns whether or not tastudio is currently engaged (active)

tastudio.getbranches
- nluatable tastudio.getbranches()
- Returns a list of the current tastudio branches. Each entry will have the Id, Frame, and Text properties of the branch

tastudio.getbranchinput
- nluatable tastudio.getbranchinput(string branchid, int frame)
- Gets the controller state of the given frame with the given branch identifier

tastudio.getmarker
- string tastudio.getmarker(int frame)
- returns the marker text at the given frame, or an empty string if there is no marker for the given frame

tastudio.getrecording
- bool tastudio.getrecording()
- returns whether or not TAStudio is in recording mode

tastudio.getselection
- nluatable tastudio.getselection()
- gets the currently selected frames

tastudio.hasstate
- bool tastudio.hasstate(int frame)
- Returns whether or not the given frame has a savestate associated with it

tastudio.islag
- bool? tastudio.islag(int frame)
- Returns whether or not the given frame was a lag frame, null if unknown

tastudio.loadbranch
- void tastudio.loadbranch(int index)
- Loads a branch at the given index, if a branch at that index exists.

tastudio.onbranchload
- void tastudio.onbranchload(nluafunc luaf)
- called whenever a branch is loaded. luaf must be a function that takes the integer branch index as a parameter

tastudio.onbranchremove
- void tastudio.onbranchremove(nluafunc luaf)
- called whenever a branch is removed. luaf must be a function that takes the integer branch index as a parameter

tastudio.onbranchsave
- void tastudio.onbranchsave(nluafunc luaf)
- called whenever a branch is created or updated. luaf must be a function that takes the integer branch index as a parameter

tastudio.ongreenzoneinvalidated
- void tastudio.ongreenzoneinvalidated(nluafunc luaf)
- called whenever the greenzone is invalidated and returns the first frame that was invalidated

tastudio.onqueryitembg
- void tastudio.onqueryitembg(nluafunc luaf)
- called during the background draw event of the tastudio listview. luaf must be a function that takes 2 params: index, column. The first is the integer row index of the listview, and the 2nd is the string column name. luaf should return a value that can be parsed into a .NET Color object (string color name, or integer value)

tastudio.onqueryitemicon
- void tastudio.onqueryitemicon(nluafunc luaf)
- called during the icon draw event of the tastudio listview. luaf must be a function that takes 2 params: index, column. The first is the integer row index of the listview, and the 2nd is the string column name. luaf should return a value that can be parsed into a .NET Color object (string color name, or integer value)

tastudio.onqueryitemtext
- void tastudio.onqueryitemtext(nluafunc luaf)
- called during the text draw event of the tastudio listview. luaf must be a function that takes 2 params: index, column. The first is the integer row index of the listview, and the 2nd is the string column name. luaf should return a value that can be parsed into a .NET Color object (string color name, or integer value)

tastudio.removemarker
- void tastudio.removemarker(int frame)
- if there is a marker for the given frame, it will be removed

tastudio.setbranchtext
- void tastudio.setbranchtext(string text, [int? index = nil])
- adds the given message to the existing branch, or to the branch that will be created next if branch index is not specified

tastudio.setlag
- void tastudio.setlag(int frame, bool? value)
- Sets the lag information for the given frame, if the frame does not exist in the lag log, it will be added. If the value is null, the lag information for that frame will be removed

tastudio.setmarker
- void tastudio.setmarker(int frame, [string message = nil])
- Adds or sets a marker at the given frame, with an optional message

tastudio.setplayback
- void tastudio.setplayback(object frame)
- Seeks the given frame (a number) or marker (a string)

tastudio.setrecording
- void tastudio.setrecording(bool val)
- sets the recording mode on/off depending on the parameter

tastudio.submitanalogchange
- void tastudio.submitanalogchange(int frame, string button, singlevalue)

tastudio.submitclearframes
- void tastudio.submitclearframes(int frame, int number)

tastudio.submitdeleteframes
- void tastudio.submitdeleteframes(int frame, int number)

tastudio.submitinputchange
- void tastudio.submitinputchange(int frame, string button, bool value)

tastudio.submitinsertframes
- void tastudio.submitinsertframes(int frame, int number)

tastudio.togglerecording
- void tastudio.togglerecording()
- toggles tastudio recording mode on/off depending on its current state

## userdata
### A library for setting and retrieving dynamic data that will be saved and loaded with savestates

userdata.clear
- void userdata.clear()
- clears all user data

userdata.containskey
- bool userdata.containskey(string key)
- returns whether or not there is an entry for the given key

userdata.get
- object userdata.get(string key)
- gets the data with the given key, if the key does not exist it will return nil

userdata.remove
- bool userdata.remove(string key)
- remove the data with the given key. Returns true if the element is successfully found and removed; otherwise, false.

userdata.set
- void userdata.set(string name, object value)
- adds or updates the data with the given key with the given value
