(*

(C) 2015-12��windwiny

AppleScript ��д�� Finder ��չ

��װ��
    ��ס Command ���϶�Ӧ�ó��򵽡�Finder���������հ״���ֱ��������ɫʮ��ͼ�꣬�ɿ���꣬�������ϳ������Ӧ�ó����ͼ�ꡣ

���ܣ�
    �� iTerm2 �նˣ��л�Ŀ¼����Finder����ǰĿ¼��û��ѡ�ļ�����£������л�����һ��ѡ�е��ļ�Ŀ¼��
	
*)


tell application "Finder"
	set sel to (get selection)
	if not sel = {} then --���ļ�/�б�ѡ��
		repeat with f in sel
			set _cwd to POSIX path of (f as alias)
			if _cwd does not end with "/" then --����/���������ļ�����ȡ����ļ����ڵ�Ŀ¼
				set _cwd to POSIX path of ((folder of f) as alias)
			end if
			exit repeat --ֻ�õ�һ��
		end repeat
	else --û��ѡ���ļ�/�У�ʹ�õ�ǰĿ¼
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
