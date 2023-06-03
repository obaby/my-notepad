# Microsoft Developer Studio Project File - Name="SoftSnoop" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** NICHT BEARBEITEN **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=SoftSnoop - Win32 Debug
!MESSAGE Dies ist kein gültiges Makefile. Zum Erstellen dieses Projekts mit NMAKE
!MESSAGE verwenden Sie den Befehl "Makefile exportieren" und führen Sie den Befehl
!MESSAGE 
!MESSAGE NMAKE /f "SoftSnoop.mak".
!MESSAGE 
!MESSAGE Sie können beim Ausführen von NMAKE eine Konfiguration angeben
!MESSAGE durch Definieren des Makros CFG in der Befehlszeile. Zum Beispiel:
!MESSAGE 
!MESSAGE NMAKE /f "SoftSnoop.mak" CFG="SoftSnoop - Win32 Debug"
!MESSAGE 
!MESSAGE Für die Konfiguration stehen zur Auswahl:
!MESSAGE 
!MESSAGE "SoftSnoop - Win32 Release" (basierend auf  "Win32 (x86) Application")
!MESSAGE "SoftSnoop - Win32 Debug" (basierend auf  "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "SoftSnoop - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /Zp1 /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib comctl32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib imagehlp.lib /nologo /base:"0x500000" /subsystem:windows /machine:I386 /out:"SoftSnoop.exe"
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "SoftSnoop - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib comctl32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib imagehlp.lib /nologo /subsystem:windows /debug /machine:I386 /out:"SoftSnoop.exe" /pdbtype:sept
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "SoftSnoop - Win32 Release"
# Name "SoftSnoop - Win32 Debug"
# Begin Group "Quellcodedateien"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\ApiParam.cpp
# End Source File
# Begin Source File

SOURCE=.\ARMMenu.cpp
# End Source File
# Begin Source File

SOURCE=.\BPMenu.cpp
# End Source File
# Begin Source File

SOURCE=.\BPMMenu.cpp
# End Source File
# Begin Source File

SOURCE=.\DumpMenu.cpp
# End Source File
# Begin Source File

SOURCE=.\lib.cpp
# End Source File
# Begin Source File

SOURCE=.\MemServer.cpp
# End Source File
# Begin Source File

SOURCE=.\ModuleMenu.cpp
# End Source File
# Begin Source File

SOURCE=.\OptionMenu.cpp
# End Source File
# Begin Source File

SOURCE=.\PEEditor.cpp
# End Source File
# Begin Source File

SOURCE=.\plugins.cpp
# End Source File
# Begin Source File

SOURCE=.\RegsMenu.cpp
# End Source File
# Begin Source File

SOURCE=.\rsrc.rc
# End Source File
# Begin Source File

SOURCE=.\SearchMenu.cpp
# End Source File
# Begin Source File

SOURCE=.\SoftSnoop.cpp
# End Source File
# Begin Source File

SOURCE=.\SoftSnoop.def
# End Source File
# Begin Source File

SOURCE=.\StackMenu.cpp
# End Source File
# Begin Source File

SOURCE=.\ToolBar.cpp
# End Source File
# End Group
# Begin Group "Ressourcendateien"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\ModuleMenu.bmp
# End Source File
# Begin Source File

SOURCE=.\SS.ico
# End Source File
# Begin Source File

SOURCE=.\toolbar.bmp
# End Source File
# End Group
# Begin Group "Header-Dateien"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\ApiParam.h
# End Source File
# Begin Source File

SOURCE=.\ARMMenu.h
# End Source File
# Begin Source File

SOURCE=.\BPM.h
# End Source File
# Begin Source File

SOURCE=.\BPMenu.h
# End Source File
# Begin Source File

SOURCE=.\BPMMenu.h
# End Source File
# Begin Source File

SOURCE=.\DumpMenu.h
# End Source File
# Begin Source File

SOURCE=.\ForceLibrary.h
# End Source File
# Begin Source File

SOURCE=.\Lib.h
# End Source File
# Begin Source File

SOURCE=.\MemServer.h
# End Source File
# Begin Source File

SOURCE=.\ModuleMenu.h
# End Source File
# Begin Source File

SOURCE=.\OptionMenu.h
# End Source File
# Begin Source File

SOURCE=.\PEEditor.h
# End Source File
# Begin Source File

SOURCE=.\plugins.h
# End Source File
# Begin Source File

SOURCE=.\RegsMenu.h
# End Source File
# Begin Source File

SOURCE=.\resource.h
# End Source File
# Begin Source File

SOURCE=.\SearchMenu.h
# End Source File
# Begin Source File

SOURCE=.\SoftSnoop.h
# End Source File
# Begin Source File

SOURCE=.\SSplugin.h
# End Source File
# Begin Source File

SOURCE=.\StackMenu.h
# End Source File
# Begin Source File

SOURCE=.\ToolBar.h
# End Source File
# End Group
# Begin Source File

SOURCE=.\history.tXt
# End Source File
# Begin Source File

SOURCE=.\Plugins.tXt
# End Source File
# Begin Source File

SOURCE=.\readme.tXt
# End Source File
# Begin Source File

SOURCE=.\ApiDef\ss.txt
# End Source File
# End Target
# End Project
