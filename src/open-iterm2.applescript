(*

(C) 2015-12，windwiny

AppleScript 编写的 Finder 扩展

安装：
    按住 Command 键拖动应用程序到『Finder』工具栏空白处，直到出现绿色十字图标，松开鼠标，工具栏上出现这个应用程序的图标。

功能：
    打开 iTerm2 终端，切换目录到『Finder』当前目录（没有选文件情况下），或切换到第一个选中的文件目录。
	
*)


tell application "Finder"
	set sel to (get selection)
	if not sel = {} then --有文件/夹被选中
		repeat with f in sel
			set _cwd to POSIX path of (f as alias)
			if _cwd does not end with "/" then --不以/结束的是文件，则取这个文件所在的目录
				set _cwd to POSIX path of ((folder of f) as alias)
			end if
			exit repeat --只用第一个
		end repeat
	else --没有选中文件/夹，使用当前目录
		set _cwd to POSIX path of ((folder of (front window)) as alias)
	end if
	
	--display dialog "cd to path: " & _cwd
end tell


tell application "iTerm"
	activate
	
	try
		set _session to current session of current terminal
	on error
		set _term to (make new terminal)
		tell _term
			launch session "Default"
			set _session to current session
		end tell
	end try
	
	tell _session
		write text "pushd " & quoted form of _cwd
	end tell
end tell
