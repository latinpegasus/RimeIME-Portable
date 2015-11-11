::复制五仓设置
set outdir=%~dp0
xcopy /S /Y "%outdir%\data\Rime\cangjie5.custom.yaml" "%appdata%\Google\Google Input Tools\Rime\"

md %pf%"\Google"
del "%appdata%\Google\Google Input Tools\Rime\default.yaml"
tskill /v GoogleInputHandler

net stop googleinputservice & tskill GoogleInputHandler
net start googleinputservice