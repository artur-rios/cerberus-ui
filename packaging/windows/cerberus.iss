; The Windows installer (Operations & Infrastructure §6.2).
;
; Built by .github/workflows/build.yml from the release bundle:
;
;   iscc /DAppVersion=0.1.0 /DSourceDir=build\windows\x64\runner\Release ^
;        /DOutputDir=dist packaging\windows\cerberus.iss
;
; Installs per user, needing no administrator rights. The local store is not
; installed: the application creates it in the user's application support
; directory at the first unlock in the default mode.

#ifndef AppVersion
  #error AppVersion must be defined
#endif
#ifndef SourceDir
  #error SourceDir must be defined
#endif
#ifndef OutputDir
  #define OutputDir "dist"
#endif

[Setup]
AppId={{6F1F8B4E-3C2A-4D57-9E0B-2B7F4C1A9D31}
AppName=Cerberus
AppVersion={#AppVersion}
AppPublisher=Artur Rios
AppPublisherURL=https://github.com/artur-rios/cerberus-ui
DefaultDirName={autopf}\Cerberus
DefaultGroupName=Cerberus
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
OutputDir={#OutputDir}
OutputBaseFilename=cerberus-ui-{#AppVersion}-windows-setup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
UninstallDisplayIcon={app}\cerberus_ui.exe

[Files]
Source: "{#SourceDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Cerberus"; Filename: "{app}\cerberus_ui.exe"
Name: "{autodesktop}\Cerberus"; Filename: "{app}\cerberus_ui.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Run]
Filename: "{app}\cerberus_ui.exe"; Description: "{cm:LaunchProgram,Cerberus}"; Flags: nowait postinstall skipifsilent
