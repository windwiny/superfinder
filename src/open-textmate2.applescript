(*

(C) 2015-12��windwiny

AppleScript ��д�� Finder ��չ

��װ��
    ��ס Command ���϶�Ӧ�ó��򵽡�Finder���������հ״���ֱ��������ɫʮ��ͼ�꣬�ɿ���꣬�������ϳ������Ӧ�ó����ͼ�ꡣ

���ܣ�
    �� TextMate2 �༭����ѡ�е��ļ���hĿ¼
	
*)


tell application "Finder"
	set sel to (get selection)
	set selp to {}
	if not sel = {} then --���ļ�/�б�ѡ��
		repeat with f in sel
			set _cwd to POSIX path of (f as alias)
			set selp to selp & {_cwd}
		end repeat
	else --û��ѡ���ļ�/�У�ʹ�õ�ǰĿ¼
		set _cwd to POSIX path of ((folder of (front window)) as alias)
		set selp to selp & {_cwd}
	end if
	
	--display dialog "selected number: " & number of selp & "	selected: " & selp
end tell

tell application "TextMate"
	activate
	open selp
end tell
