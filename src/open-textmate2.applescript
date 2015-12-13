(*

(C) 2015-12，windwiny

AppleScript 编写的 Finder 扩展

安装：
    按住 Command 键拖动应用程序到『Finder』工具栏空白处，直到出现绿色十字图标，松开鼠标，工具栏上出现这个应用程序的图标。

功能：
    用 TextMate2 编辑器打开选中的文件、h目录
	
*)


tell application "Finder"
	set sel to (get selection)
	set selp to {}
	if not sel = {} then --有文件/夹被选中
		repeat with f in sel
			set _cwd to POSIX path of (f as alias)
			set selp to selp & {_cwd}
		end repeat
	else --没有选中文件/夹，使用当前目录
		set _cwd to POSIX path of ((folder of (front window)) as alias)
		set selp to selp & {_cwd}
	end if
	
	--display dialog "selected number: " & number of selp & "	selected: " & selp
end tell

tell application "TextMate"
	activate
	open selp
end tell
