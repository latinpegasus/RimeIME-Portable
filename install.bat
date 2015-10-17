set outdir=%~dp0
if %PROCESSOR_ARCHITECTURE% == AMD64 (
  set pf="C:\Program Files (x86)"
  copy %outdir%\frontend_component_x64.dll C:\windows\system32\input.ime
  copy %outdir%\frontend_component.dll C:\windows\syswow64\input.ime
) else (
  set pf="C:\Program Files"
  copy %outdir%\frontend_component.dll C:\windows\system32\input.ime
)
%outdir%\win32_register.exe --action=register_ime --languageid=0x0804 --name=InputTools --filename=input.ime
regedit %~dp0\registry.reg
md "C:\ProgramData\Google"
md "C:\ProgramData\Google\Google Input Tools"
xcopy /S /Y %outdir%\data\* "C:\ProgramData\Google\Google Input Tools"
xcopy /S /Y "%outdir%\data\Rime\cangjie5.custom.yaml" "%appdata%\Google\Google Input Tools\Rime\"
md %pf%"\Google"
md %pf%"\Google\Google Input Tools"
copy %outdir%\rime\*.dll %pf%"\Google\Google Input Tools"
copy %outdir%\ipc_console.exe %pf%"\Google\Google Input Tools\GoogleInputHandler.exe"
copy %outdir%\ipc_service.exe %pf%"\Google\Google Input Tools\GoogleInputService.exe"
%pf%"\Google\Google Input Tools\GoogleInputService.exe" /RegServer
%pf%"\Google\Google Input Tools\GoogleInputService.exe" /Service
net start GoogleInputService
pause
