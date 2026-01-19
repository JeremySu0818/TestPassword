[Setup]
AppName=TestPassword
AppVersion=1.0.0
PrivilegesRequired=lowest
DefaultDirName={localappdata}\TestPassword
DefaultGroupName=TestPassword
UninstallDisplayIcon={app}\TestPassword.exe
Compression=lzma2
SolidCompression=yes
OutputDir=.
OutputBaseFilename=TestPassword-Setup
SetupIconFile=icon.ico

[Files]
Source: "dist\TestPassword.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\TestPassword"; Filename: "{app}\TestPassword.exe"
Name: "{commondesktop}\TestPassword"; Filename: "{app}\TestPassword.exe"

[Run]
Filename: "{app}\TestPassword.exe"; Description: "Launch TestPassword"; Flags: postinstall nowait