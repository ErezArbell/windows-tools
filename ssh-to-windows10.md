# SSH without password to Windows 10

### install Openssl

From Powershell as admin:
```
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
```

#### In file C:\ProgramData\ssh\sshd_config
comment the lines in the bottom:
```
Match Group administrators
       AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys
```
uncomment:
```
PubkeyAuthentication yes
```

#### Add public key

Add public key to c:\users\<user>\.ssh\authorized_keys

#### Fix permissions

Get and unzip <https://github.com/PowerShell/Win32-OpenSSH/releases/download/v8.1.0.0p1-Beta/OpenSSH-Win64.zip>  
From Powershell as admin run
```
./FixHostFilePermissions.ps1
./FixUserFilePermissions.ps1
```

#### Set up default shell for ssh

Run from PowerShell as admin:
```
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\WINDOWS\System32\bash.exe" -PropertyType String -Force
```
