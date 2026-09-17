Set WshShell = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
' Get current directory correctly
strPath = FSO.GetParentFolderName(WScript.ScriptFullName)
' Path to pythonw.exe in venv
pythonExe = chr(34) & strPath & "\venv\Scripts\pythonw.exe" & chr(34)
scriptPath = chr(34) & strPath & "\app.py" & chr(34)
' Run hidden (0)
WshShell.Run pythonExe & " " & scriptPath, 0, False
