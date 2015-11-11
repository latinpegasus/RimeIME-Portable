set outdir=%~dp0
if %PROCESSOR_ARCHITECTURE% == AMD64 (
  set pf="C:\Program Files (x86)"
) else (
  set pf="C:\Program Files"
)


net stop GoogleInputService

%pf%"\Google\Google Input Tools\GoogleInputService.exe" /UnregServer



taskkill /f /im GoogleInputHandler.exe

%outdir%\win32_register.exe --action=unregister_ime --languageid=0x0804 --name=InputTools --filename=input.ime

del c:\windows\system32\input.ime
del c:\windows\syswow64\input.ime

rmdir /s /q %pf%"\Google"

rmdir /s /q "C:\ProgramData\Google\Google Input Tools"

rmdir /s /q %appdata%"\Google"


pause
