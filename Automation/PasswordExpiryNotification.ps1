#Add the Quest PowerShell snapin
Add-PsSnapIn Quest.ActiveRoles.ADManagement -ErrorAction SilentlyContinue
$logdate = Get-Date -format yyyyMMdd
$logfile = "E:\scripts\logs\passwordlog"+$logdate+".txt"
Get-QADUser -SizeLimit 0 | Select-Object samAccountName,mail,PasswordStatus,FirstName,name | 
Where-Object {$_.PasswordStatus -ne "Password never expires" -and $_.PasswordStatus -ne "Expired" -and $_.PasswordStatus -ne "User must change password at next logon." -and $_.mail -ne $null} | 

ForEach-Object {
  $today = Get-Date
  $name = $_.name
  $samaccountname = $_.samAccountName
  $mail = $_.mail 
  $passwordstatus = $_.PasswordStatus
  $passwordexpiry = $passwordstatus.Replace("Expires at: ","")
  $passwordexpirydate = Get-Date $passwordexpiry
  $daystoexpiry = ($passwordexpirydate - $today).Days
  $smtpserver = "XXXXXXXXXXXXXXX"
  #$attachment = "X:\Instructions\PasswordChange.doc"
  $emailFrom = "XXXXXXXXXXXXXXX@XXXXXXXXX.XXX"
  
  $body = 
  "Dear $($_.FirstName),
Your Domain password will expire in $daystoexpiry days. Please change it soon to avoid losing access to your computer, email, and the network.
After changing the password on your computer, you will also need to enter your password in Outlook and update it on your mobile devices.

Outlook (on Windows and Mac) will pop up and prompt you to enter a new password.  For email, your username is $mail.  Check mark the box to save remember your password.

Update your account information on any mobile devices you use (phone or tablet). Each mobile device differs on settings.  In general, go to Settings and find the section for accounts.  Change the password in the settings for your  email account. 


To change your password, follow one of the methods below:

1. On your Windows computer
	a.	If you have a laptop, plug into the wired network in your office.  If you are not in the office, logon and connect to VPN. 
	b.	If you have a desktop, logon as usual.
	c.	Press Ctrl-Alt-Del and click on ""Change Password"".
	d.	Fill in your old password and set a new password.  See the password requirements below.
	e.	Press OK to return to your desktop. 

2. On your Macintosh computer
	a.	If you have a laptop, plug into the wired network in your office.  If you are not in the office, logon and connect to VPN.
	b.	If you have a desktop, logon as usual.
	c.	Open ""System Preferences""
	d.	Under Systems, click on ""Users & Groups""
	e.	Click ""Change Password""
	f.	Fill in your old password and set a new password.  See the password requirements below.
	g.	Click ""Change Password"" again to save.

The new password must meet the minimum requirements set forth in our corporate policies including:
	1.	It must be at least 8 characters long.
	2.	It must contain at least one character from 3 of the 4 following groups of characters:
		a.  Uppercase letters (A-Z)
		b.  Lowercase letters (a-z)
		c.  Numbers (0-9)
		d.  Symbols (!@#$%^&*...)
	3.	It cannot match any of your past 24 passwords.
	4.	It cannot contain characters which match 3 or more consecutive characters of your username.
	5.	You cannot change your password more often than once in a 24 hour period.

If you have any questions please contact the Global Service Desk at "


# This is the logic for who to send the email to.  it MUST go smallest to largest (1, 5, 14 etc)

if (($daystoexpiry -eq 1) -or ($daystoexpiry -eq 5) -or ($daystoexpiry -eq 14)) {
    $emailTo = "$mail"
    $subject = "Your Network password will expire in $daystoexpiry day(s)."    
    Send-MailMessage -To $emailTo -From $emailFrom -Subject $subject -Body $body -SmtpServer $smtpserver
    Write-Host "Email was sent to $mail on $today"
    Add-Content $logfile  "Password expiration email was sent to $name, $mail on $today.  Their password expires $passwordexpiry"
  }
}
 Send-MailMessage -To "XXXXXXXXX@XXXX.org" -CC "XXXX@XXXXX.org" -From "GlobalServiceDesk@XXXX.org" -Subject "Password expiration log for $today" -Body "Here is the Password Expiration log from $today" -Attachments $logfile -SmtpServer $smtpserver