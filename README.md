# ncRemRun
Remote command execution with netcat on Windows

## About
A tiny script which listens for commands over the network and executes them.

## Usage  
### Server:  
Run `ncRemRun.cmd` on the target PC(s).  
Make sure the PC has [netcat](https://github.com/aaviator42/netcat-for-windows) (`nc.exe`) in the same directory or `%PATH%`.  
You can configure the port in the script.

### Send Commands:
#### Option 1:
Run `client_ui.cmd`. It's an interactive script which will ask for the hostname and commands. Requires powershell.

#### Option 2:
Run `client_cli.cmd "<hostname>" "<command>"`. Requires powershell.

#### Option 3:
Send a GET request (with wget or PowerShell or cURL or whatever):  
`hostname/<command-goes-here>`

##### browsers:
open `http://<hostname>/<command>`

##### curl:
`curl <hostname>/<command>`

##### wget:
`wget --timeout=1 --tries=1 -qO- "<hostname>/<command>"`

##### powershell:
`powershell -c iwr "\"<hostame>/<command>\"" -UseB  >nul`

## Notes
1. No auth or encryption. This was made to be used with a renderfarm in a safe and trusted environment on a secured network.  
2. The script will ignore duplicate commands. If you want to run the same command multiple times, send the command "`null`" between each iteration.  
3. ¯\\\_(ツ)_/¯
