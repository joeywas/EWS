---
external help file: EWS-help.xml
Module Name: EWS
online version:
schema: 2.0.0
---

# Connect-EWSService

## SYNOPSIS

Connects to Exchange Web Service.

## SYNTAX

```powershell
Connect-EWSService [-Mailbox] <String> [[-ServiceUrl] <String>] [[-Version] <ExchangeVersion>]
 [[-Credential] <PSCredential>] [[-OauthToken] <String>] [<CommonParameters>]
```

## DESCRIPTION

Function that needs to be used first in order to create connection to Exchange Web Service.
It supports user-provided credentials, Oauth2 token, and default credentials.
By default it will attempt to auto-discover service URL. User may decide to provide it manually.

## EXAMPLES

### EXAMPLE 1

```powershell
PS C:\> Connect-EWSService -Mailbox bartek.bielawski@live.com
```

Connects to `bartek.bielawski@live.com` mailbox.
Uses default credentials and auto-discovers service URL.

### EXAMPLE 2

```powershell
PS C:\> Connect-EWSService -Mailbox bartek.bielawski@live.com -Credential bartek.bielawski@live.com
```

Connects to `bartek.bielawski@live.com` mailbox.
Prompts for `bartek.bielawski@live.com` password.
Auto-discovers service URL.

### EXAMPLE 3

```powershell
PS C:\> $Token = Get-EWSOauthToken
PS C:\> $ServiceURL = 'https://outlook.office365.com/EWS/Exchange.asmx'
PS C:\> $Mailbox = 'bartek.bielawski@abc123.onmicrosoft.com'
PS C:\> Connect-EWSService -Mailbox $Mailbox -ServiceURL $ServiceURL -OauthToken $Token
```

Connects to `bartek.bielawski@abc123.onmicrosoft.com` mailbox.
Uses the Microsoft 365 Exchange Web Services service url.
Uses an Oauth2 access token obtained with `Get-EWSOauthToken`.

## PARAMETERS

### -Credential

Credentials used to authenticate to Exchange Web Service.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Mailbox

Mailbox that supports Exchange Web Services.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServiceUrl

Optional URL to service (when specified, auto-discovery is not used).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Version

Version of Exchange Web Service.

```yaml
Type: ExchangeVersion
Parameter Sets: (All)
Aliases:
Accepted values: Exchange2007_SP1, Exchange2010, Exchange2010_SP1, Exchange2010_SP2, Exchange2013, Exchange2013_SP1

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OauthToken

Oauth2 access token

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters [http://go.microsoft.com/fwlink/?LinkID=113216](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### Microsoft.Exchange.WebServices.Data.ExchangeService

## NOTES

## RELATED LINKS
