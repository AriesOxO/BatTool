@echo off
color 02

:input_port
set /p port=������˿ںţ�
if "%port%" == "" goto input_port

:find_process
echo ���ڲ��Ҷ˿� %port% ʹ�õĽ���...
netstat -ano | findstr /r /c:"%port%.*LISTENING" > temp.txt
type temp.txt
set /p pid=��������� PID�������� Q �˳���
if /i "%pid%" == "Q" goto end

:terminate_process
echo ������ֹ���� %pid% ...
taskkill /f /pid %pid%
if %errorlevel% equ 5 (
    echo ��Ҫ�Թ���Ա������д˽ű���
    echo ���Ҽ�ѡ���Թ���Ա������С���
    pause
    exit
) else (
    echo ���� %pid% �Ѿ�����ֹ��
)

:end
del temp.txt
