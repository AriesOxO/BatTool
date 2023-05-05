@echo off
color 02

:input_port
set /p port=请输入端口号：
if "%port%" == "" goto input_port

:find_process
echo 正在查找端口 %port% 使用的进程...
netstat -ano | findstr /r /c:"%port%.*LISTENING" > temp.txt
type temp.txt
set /p pid=请输入进程 PID，或输入 Q 退出：
if /i "%pid%" == "Q" goto end

:terminate_process
echo 正在终止进程 %pid% ...
taskkill /f /pid %pid%
if %errorlevel% equ 5 (
    echo 需要以管理员身份运行此脚本！
    echo 请右键选择“以管理员身份运行”。
    pause
    exit
) else (
    echo 进程 %pid% 已经被终止。
)

:end
del temp.txt
