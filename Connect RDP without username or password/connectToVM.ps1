<#
.SYNOPSIS
    This script opens VM automatically without entering username and password.
.DESCRIPTION
    Got to provide serverName, username and password in the XML file.
.EXAMPLE
    The example below does blah
.NOTES
    Author: Ankit Agarwal
    Last Edit: 10th May 2022
    Version 1.0 - initial release of Script
#>

$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path
$settingspath = $directorypath + 'settings.xml'

[XML]$settings = Get-Content $settingspath

$server = $settings.Config.prod.workstation.name
$username = $settings.Config.General.username
$password = $settings.Config.General.password

Write-Host "Connecting to $server"

cmdkey /generic:TERMSRV/$server /user:$username /pass:$password
mstsc /v:$server

