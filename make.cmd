@echo off
for /f "tokens=1* delims==" %%a in ('set') do (
if "%%a" NEQ "TMP" (
if "%%a" NEQ "windir" (
if "%%a" NEQ "USERPROFILE" (
if "%%a" NEQ "SystemRoot" ( set %%a=
) ) ) ) )
set OLDDIR=%CD%
cd ..
set PROCTS_DIR=%CD%
chdir /d %OLDDIR%
echo %PROCTS_DIR%
REM set MSC_INCLUDE_BASE=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.14.26428\
REM set SDK_INCLUDE_BASE=C:\Program Files (x86)\Windows Kits\10\Include\10.0.17134.0\
REM set MSC_BIN_BASE=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.14.26428\bin\
REM set SDK_BIN_BASE=C:\Program Files (x86)\Windows Kits\10\bin\10.0.17134.0\
REM set MSC_LIB_BASE=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.14.26428\lib\
REM set SDK_LIB_BASE=C:\Program Files (x86)\Windows Kits\10\Lib\10.0.17134.0\
set MSC_INCLUDE_BASE=%PROCTS_DIR%\share000\ext\tgt\msc\win\
set SDK_INCLUDE_BASE=%PROCTS_DIR%\share000\ext\tgt\sdk\win\10.0.17134.0\include\
set MSC_BIN_BASE=%PROCTS_DIR%\share000\ext\tgt\msc\win\bin\
set SDK_BIN_BASE=%PROCTS_DIR%\share000\ext\tgt\sdk\win\10.0.17134.0\bin\
set MSC_LIB_BASE=%PROCTS_DIR%\share000\ext\tgt\msc\win\lib\
set SDK_LIB_BASE=%PROCTS_DIR%\share000\ext\tgt\sdk\win\10.0.17134.0\lib\
SET INCLUDE=%MSC_INCLUDE_BASE%include;%SDK_INCLUDE_BASE%shared;%SDK_INCLUDE_BASE%ucrt;%SDK_INCLUDE_BASE%um;
mkdir tgt
mkdir obj
mkdir tgt\fig
mkdir obj\rearchive
SET PATH=%MSC_BIN_BASE%Hostx86\x64;%MSC_BIN_BASE%Hostx86\x86;%SDK_BIN_BASE%x64;
SET LIB=%MSC_LIB_BASE%x64;%SDK_LIB_BASE%ucrt\x64;%SDK_LIB_BASE%um\x64;
mkdir tgt\winx64d
mkdir obj\rearchive\winx64d
cd comp\rearchive
"%MSC_BIN_BASE%HostX86\x64\CL.exe" /c /ZI /nologo /W3 /WX- /diagnostics:classic /sdl /Od /D _DEBUG /D _CONSOLE /D _UNICODE /D UNICODE /D _SCL_SECURE_NO_WARNINGS /Gm- /EHsc /RTC1 /MDd /GS /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /std:c++latest /experimental:module /Fo"%PROCTS_DIR%\rearchive\obj\rearchive\winx64d\\" /Fd"%PROCTS_DIR%\rearchive\obj\rearchive\winx64d\vc141.pdb" /Gd /TP /FC /errorReport:prompt  /module:stdIfcDir "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.14.26428\ifc\x64" rearchive.cpp
"%MSC_BIN_BASE%HostX86\x64\link.exe" /ERRORREPORT:PROMPT /OUT:"%PROCTS_DIR%\rearchive\tgt\winx64d\rearchive.exe" /INCREMENTAL /NOLOGO /MANIFEST /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG:FASTLINK /PDB:"%PROCTS_DIR%\rearchive\tgt\winx64d\rearchive.pdb" /SUBSYSTEM:CONSOLE /TLBID:1 /DYNAMICBASE /NXCOMPAT /IMPLIB:"%PROCTS_DIR%\rearchive\tgt\winx64d\rearchive.lib" /MACHINE:X64 %PROCTS_DIR%\rearchive\obj\rearchive\winx64d\rearchive.obj
cd ..\..
SET PATH=%MSC_BIN_BASE%Hostx86\x64;%MSC_BIN_BASE%Hostx86\x86;%SDK_BIN_BASE%x64;
SET LIB=%MSC_LIB_BASE%x64;%SDK_LIB_BASE%ucrt\x64;%SDK_LIB_BASE%um\x64;
mkdir tgt\winx64r
mkdir obj\rearchive\winx64r
cd comp\rearchive
"%MSC_BIN_BASE%HostX86\x64\CL.exe" /c /Zi /nologo /W3 /WX- /diagnostics:classic /sdl /O2 /Oi /GL /D NDEBUG /D _CONSOLE /D _UNICODE /D UNICODE /D _SCL_SECURE_NO_WARNINGS /Gm- /EHsc /MD /GS /Gy /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /std:c++latest /experimental:module /Fo"%PROCTS_DIR%\rearchive\obj\rearchive\winx64r\\" /Fd"%PROCTS_DIR%\rearchive\obj\rearchive\winx64r\vc141.pdb" /Gd /TP /FC /errorReport:prompt  /module:stdIfcDir "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.14.26428\ifc\x64" rearchive.cpp
"%MSC_BIN_BASE%HostX86\x64\link.exe" /ERRORREPORT:PROMPT /OUT:"%PROCTS_DIR%\rearchive\tgt\winx64r\rearchive.exe" /INCREMENTAL:NO /NOLOGO /MANIFEST /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG /PDB:"%PROCTS_DIR%\rearchive\tgt\winx64r\rearchive.pdb" /SUBSYSTEM:CONSOLE /OPT:REF /OPT:ICF /LTCG:incremental /TLBID:1 /DYNAMICBASE /NXCOMPAT /IMPLIB:"%PROCTS_DIR%\rearchive\tgt\winx64r\rearchive.lib" /MACHINE:X64 %PROCTS_DIR%\rearchive\obj\rearchive\winx64r\rearchive.obj
cd ..\..
SET PATH=%MSC_BIN_BASE%Hostx86\x86;%SDK_BIN_BASE%x86;
SET LIB=%MSC_LIB_BASE%x86;%SDK_LIB_BASE%ucrt\x86;%SDK_LIB_BASE%um\x86;
mkdir tgt\winx86d
mkdir obj\rearchive\winx86d
cd comp\rearchive
"%MSC_BIN_BASE%HostX86\x86\CL.exe" /c /ZI /nologo /W3 /WX- /diagnostics:classic /sdl /Od /Oy- /D WIN32 /D _DEBUG /D _CONSOLE /D _UNICODE /D UNICODE /D _SCL_SECURE_NO_WARNINGS /Gm- /EHsc /RTC1 /MDd /GS /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /std:c++latest /Fo"%PROCTS_DIR%\rearchive\obj\rearchive\winx86d\\" /Fd"%PROCTS_DIR%\rearchive\obj\rearchive\winx86d\vc141.pdb" /Gd /TP /analyze- /FC /errorReport:prompt rearchive.cpp
"%MSC_BIN_BASE%HostX86\x86\link.exe" /ERRORREPORT:PROMPT /OUT:"%PROCTS_DIR%\rearchive\tgt\winx86d\rearchive.exe" /INCREMENTAL /NOLOGO /MANIFEST /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG:FASTLINK /PDB:"%PROCTS_DIR%\rearchive\tgt\winx86d\rearchive.pdb" /SUBSYSTEM:CONSOLE /TLBID:1 /DYNAMICBASE /NXCOMPAT /IMPLIB:"%PROCTS_DIR%\rearchive\tgt\winx86d\rearchive.lib" /MACHINE:X86 %PROCTS_DIR%\rearchive\obj\rearchive\winx86d\rearchive.obj
cd ..\..
SET PATH=%MSC_BIN_BASE%Hostx86\x86;%SDK_BIN_BASE%x86;
SET LIB=%MSC_LIB_BASE%x86;%SDK_LIB_BASE%ucrt\x86;%SDK_LIB_BASE%um\x86;
mkdir tgt\winx86r
mkdir obj\rearchive\winx86r
cd comp\rearchive
"%MSC_BIN_BASE%HostX86\x86\CL.exe" /c /Zi /nologo /W3 /WX- /diagnostics:classic /sdl /O2 /Oi /Oy- /GL /D WIN32 /D NDEBUG /D _CONSOLE /D _UNICODE /D UNICODE /D _SCL_SECURE_NO_WARNINGS /Gm- /EHsc /MD /GS /Gy /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /std:c++latest /experimental:module /Fo"%PROCTS_DIR%\rearchive\obj\rearchive\winx86r\\" /Fd"%PROCTS_DIR%\rearchive\obj\rearchive\winx86r\vc141.pdb" /Gd /TP /analyze- /FC /errorReport:prompt  /module:stdIfcDir "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.14.26428\ifc\x86" rearchive.cpp
"%MSC_BIN_BASE%HostX86\x86\link.exe" /ERRORREPORT:PROMPT /OUT:"%PROCTS_DIR%\rearchive\tgt\winx86r\rearchive.exe" /INCREMENTAL:NO /NOLOGO /MANIFEST /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG /PDB:"%PROCTS_DIR%\rearchive\tgt\winx86r\rearchive.pdb" /SUBSYSTEM:CONSOLE /OPT:REF /OPT:ICF /LTCG:incremental /TLBID:1 /DYNAMICBASE /NXCOMPAT /IMPLIB:"%PROCTS_DIR%\rearchive\tgt\winx86r\rearchive.lib" /MACHINE:X86 /SAFESEH %PROCTS_DIR%\rearchive\obj\rearchive\winx86r\rearchive.obj
cd ..\..
mkdir obj\flying_start
SET PATH=%MSC_BIN_BASE%Hostx86\x64;%MSC_BIN_BASE%Hostx86\x86;%SDK_BIN_BASE%x64;
SET LIB=%MSC_LIB_BASE%x64;%SDK_LIB_BASE%ucrt\x64;%SDK_LIB_BASE%um\x64;
mkdir tgt\winx64d
mkdir obj\flying_start\winx64d
cd comp\flying_start
"%MSC_BIN_BASE%HostX86\x64\CL.exe" /c /I../../../share000/intf /ZI /nologo /W3 /WX- /diagnostics:classic /Od /D _DEBUG /D _CONSOLE /D "TARGET_DIR=\"winx64d\"" /D _DEBUG /D _CONSOLE /D _UNICODE /D UNICODE /Gm- /EHsc /RTC1 /MDd /GS /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /std:c++latest /Fo"%PROCTS_DIR%\rearchive\obj\flying_start\winx64d\\" /Fd"%PROCTS_DIR%\rearchive\obj\flying_start\winx64d\vc141.pdb" /Gd /TP /FC /errorReport:prompt flying_start.cpp
"%MSC_BIN_BASE%HostX86\x64\link.exe" /ERRORREPORT:PROMPT /OUT:"%PROCTS_DIR%\rearchive\tgt\winx64d\flying_start_rearchive.exe" /INCREMENTAL /NOLOGO /LIBPATH:%PROCTS_DIR%\rearchive\../share000/ext/lib/git2/winx64d /LIBPATH:%PROCTS_DIR%\rearchive\../share000/ext/lib/ssh2/winx64d /LIBPATH:%PROCTS_DIR%\rearchive\../share000/tgt/winx64d repo.lib git2.lib libssh2.lib crypt32.lib rpcrt4.lib winhttp.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /MANIFEST /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG:FASTLINK /PDB:"%PROCTS_DIR%\rearchive\tgt\winx64d\flying_start_rearchive.pdb" /SUBSYSTEM:CONSOLE /TLBID:1 /DYNAMICBASE /NXCOMPAT /IMPLIB:"%PROCTS_DIR%\rearchive\tgt\winx64d\flying_start_rearchive.lib" /MACHINE:X64 %PROCTS_DIR%\rearchive\obj\flying_start\winx64d\flying_start.obj
cd ..\..
SET PATH=%MSC_BIN_BASE%Hostx86\x64;%MSC_BIN_BASE%Hostx86\x86;%SDK_BIN_BASE%x64;
SET LIB=%MSC_LIB_BASE%x64;%SDK_LIB_BASE%ucrt\x64;%SDK_LIB_BASE%um\x64;
mkdir tgt\winx64r
mkdir obj\flying_start\winx64r
cd comp\flying_start
"%MSC_BIN_BASE%HostX86\x64\CL.exe" /c /I../../../share000/intf /Zi /nologo /W3 /WX- /diagnostics:classic /O2 /Oi /GL /D NDEBUG /D _CONSOLE /D "TARGET_DIR=\"winx64r\"" /D NDEBUG /D _CONSOLE /D _UNICODE /D UNICODE /Gm- /EHsc /MD /GS /Gy /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /std:c++latest /Fo"%PROCTS_DIR%\rearchive\obj\flying_start\winx64r\\" /Fd"%PROCTS_DIR%\rearchive\obj\flying_start\winx64r\vc141.pdb" /Gd /TP /FC /errorReport:prompt flying_start.cpp
"%MSC_BIN_BASE%HostX86\x64\link.exe" /ERRORREPORT:PROMPT /OUT:"%PROCTS_DIR%\rearchive\tgt\winx64r\flying_start_rearchive.exe" /INCREMENTAL:NO /NOLOGO /LIBPATH:%PROCTS_DIR%\rearchive\../share000/ext/lib/git2/winx64r /LIBPATH:%PROCTS_DIR%\rearchive\../share000/ext/lib/ssh2/winx64r /LIBPATH:%PROCTS_DIR%\rearchive\../share000/tgt/winx64r repo.lib git2.lib libssh2.lib crypt32.lib rpcrt4.lib winhttp.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /MANIFEST /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG:FULL /PDB:"%PROCTS_DIR%\rearchive\tgt\winx64r\flying_start_rearchive.pdb" /SUBSYSTEM:CONSOLE /OPT:REF /OPT:ICF /LTCG:incremental /TLBID:1 /DYNAMICBASE /NXCOMPAT /IMPLIB:"%PROCTS_DIR%\rearchive\tgt\winx64r\flying_start_rearchive.lib" /MACHINE:X64 %PROCTS_DIR%\rearchive\obj\flying_start\winx64r\flying_start.obj
cd ..\..
SET PATH=%MSC_BIN_BASE%Hostx86\x86;%SDK_BIN_BASE%x86;
SET LIB=%MSC_LIB_BASE%x86;%SDK_LIB_BASE%ucrt\x86;%SDK_LIB_BASE%um\x86;
mkdir tgt\winx86d
mkdir obj\flying_start\winx86d
cd comp\flying_start
"%MSC_BIN_BASE%HostX86\x86\CL.exe" /c /I../../../share000/intf /ZI /nologo /W3 /WX- /diagnostics:classic /Od /Oy- /D WIN32 /D _DEBUG /D _CONSOLE /D "TARGET_DIR=\"winx86d\"" /D WIN32 /D _DEBUG /D _CONSOLE /D _UNICODE /D UNICODE /Gm- /EHsc /RTC1 /MDd /GS /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /std:c++latest /Fo"%PROCTS_DIR%\rearchive\obj\flying_start\winx86d\\" /Fd"%PROCTS_DIR%\rearchive\obj\flying_start\winx86d\vc141.pdb" /Gd /TP /analyze- /FC /errorReport:prompt flying_start.cpp
"%MSC_BIN_BASE%HostX86\x86\link.exe" /ERRORREPORT:PROMPT /OUT:"%PROCTS_DIR%\rearchive\tgt\winx86d\flying_start_rearchive.exe" /INCREMENTAL /NOLOGO /LIBPATH:%PROCTS_DIR%\rearchive\../share000/ext/lib/git2/winx86d /LIBPATH:%PROCTS_DIR%\rearchive\../share000/ext/lib/ssh2/winx86d /LIBPATH:%PROCTS_DIR%\rearchive\../share000/tgt/winx86d repo.lib git2.lib libssh2.lib crypt32.lib rpcrt4.lib winhttp.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /MANIFEST /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG:FASTLINK /PDB:"%PROCTS_DIR%\rearchive\tgt\winx86d\flying_start_rearchive.pdb" /SUBSYSTEM:CONSOLE /TLBID:1 /DYNAMICBASE /NXCOMPAT /IMPLIB:"%PROCTS_DIR%\rearchive\tgt\winx86d\flying_start_rearchive.lib" /MACHINE:X86 %PROCTS_DIR%\rearchive\obj\flying_start\winx86d\flying_start.obj
cd ..\..
SET PATH=%MSC_BIN_BASE%Hostx86\x86;%SDK_BIN_BASE%x86;
SET LIB=%MSC_LIB_BASE%x86;%SDK_LIB_BASE%ucrt\x86;%SDK_LIB_BASE%um\x86;
mkdir tgt\winx86r
mkdir obj\flying_start\winx86r
cd comp\flying_start
"%MSC_BIN_BASE%HostX86\x86\CL.exe" /c /I../../../share000/intf /Zi /nologo /W3 /WX- /diagnostics:classic /O2 /Oi /Oy- /GL /D WIN32 /D NDEBUG /D _CONSOLE /D "TARGET_DIR=\"winx86r\"" /D WIN32 /D NDEBUG /D _CONSOLE /D _UNICODE /D UNICODE /Gm- /EHsc /MD /GS /Gy /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /std:c++latest /Fo"%PROCTS_DIR%\rearchive\obj\flying_start\winx86r\\" /Fd"%PROCTS_DIR%\rearchive\obj\flying_start\winx86r\vc141.pdb" /Gd /TP /analyze- /FC /errorReport:prompt flying_start.cpp
"%MSC_BIN_BASE%HostX86\x86\link.exe" /ERRORREPORT:PROMPT /OUT:"%PROCTS_DIR%\rearchive\tgt\winx86r\flying_start_rearchive.exe" /INCREMENTAL:NO /NOLOGO /LIBPATH:%PROCTS_DIR%\rearchive\../share000/ext/lib/git2/winx86r /LIBPATH:%PROCTS_DIR%\rearchive\../share000/ext/lib/ssh2/winx86r /LIBPATH:%PROCTS_DIR%\rearchive\../share000/tgt/winx86r repo.lib git2.lib libssh2.lib crypt32.lib rpcrt4.lib winhttp.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /MANIFEST /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG:FULL /PDB:"%PROCTS_DIR%\rearchive\tgt\winx86r\flying_start_rearchive.pdb" /SUBSYSTEM:CONSOLE /OPT:REF /OPT:ICF /LTCG:incremental /TLBID:1 /DYNAMICBASE /NXCOMPAT /IMPLIB:"%PROCTS_DIR%\rearchive\tgt\winx86r\flying_start_rearchive.lib" /MACHINE:X86 /SAFESEH %PROCTS_DIR%\rearchive\obj\flying_start\winx86r\flying_start.obj
cd ..\..
