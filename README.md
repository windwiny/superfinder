
# Finder 扩展 README

 © 2015

Finder 扩展有『应用程序』、『服务』，可以使用 『脚本编辑器』、『automator』制作。



##  AppleScript /automator 编写的 『应用程序』， 以  .app 结尾

### 安装：

    把『应用程序』放在任何一个目录下，
    按住 Command 键拖动应用程序到『Finder』工具栏空白处，直到出现绿色十字图标，松开鼠标，工具栏上出现这个应用程序的图标。

    这个程序不能删除，但可以移动目录，移动到不同的目录后，『Finder』工具栏上这个程序的提示应该会自动变化。



### 查看应用程序的功能、源代码：

    右键点『应用程序』，选『显示包内容』，
    如果存在 Contents/Resources/Scripts/main.scpt 文件，则这个是使用 applescript 语言编写的，
        可以使用『脚本编辑器』打开这个程序，查看源码注释。

    如果存在 Contents/document.workflow 文件，则这个是使用 automator 生成的，
        使用『automator』打开这个程序，查看工作流的内容。


    Contents/Resources/****.icns 是图标文件，可以自行替换。



## Automator 编写的『服务』， 以 .workflow 结尾

### 安装：

    把『服务』放在 ~/Library/Services/ 目录下

    右键点文件或目录显示右键菜单，在『服务』菜单下会列出对应本文件可用的项目。



### 查看服务功能及实现方式：

    右键点『服务』，选『显示包内容』，存在 Contents/document.workflow 文件
        使用『automator』打开这个服务，查看工作流的内容。

