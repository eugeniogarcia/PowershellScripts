# Get-ExecutionPolicy

You can configure the following policy settings:

- __AllSigned__. Limits script execution on all signed scripts. This setting requires that all scripts are signed by a trusted publisher, including scripts that you write on the local computer. It prompts you before running scripts from publishers that you haven't yet classified as trusted or untrusted. However, verifying the signature of a script doesn't eliminate the possibility of that script being malicious. It simply provides an extra check that minimizes this possibility.
- __Default__. Sets the default execution policy, which is Restricted for Windows clients and RemoteSigned for Windows servers.
- __RemoteSigned__. This is the default execution policy for Windows server computers. Scripts can run, but the policy requires a digital signature from a trusted publisher on scripts and configuration files that have been downloaded from the internet. This setting doesn't require digital signatures on scripts that are written on the local computer.
- __Restricted__. This is the default execution policy for Windows client computers. It permits running individual commands, but it doesn't allow scripts.
- __Unrestricted__. This is the default execution policy for non-Windows computers, which you can't change. It allows unsigned scripts to run. This policy warns the user before running scripts and configuration files that aren't from the local intranet zone.
- __Undefined__. Indicates that there isn't an execution policy set in the current scope. If the execution policy in all scopes is Undefined, the effective execution policy is Restricted for Windows clients and RemoteSigned for Windows Server.