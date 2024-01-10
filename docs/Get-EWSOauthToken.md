---
external help file: EWS-help.xml
Module Name: EWS
online version:
schema: 2.0.0
---

# Get-EWSOauthToken

## SYNOPSIS

Get access token from Microsoft Entra ID OAuth2 endpoint

## SYNTAX

```powershell
Get-EWSOauthToken [-TenantId] <String> [-AppID] <String> [-AppSecret] <String> [<CommonParameters>]
```

## DESCRIPTION

Function that gets a limited duration (normally 60 minutes) Oauth2 access token with scoped of `https://outlook.office365.com/.default`. This should be used first before Connect-EWSService if intending to use Oauth2.

## EXAMPLES

### EXAMPLE 1

```powershell
PS C:\> $TenantId = '123e4567-e89b-12d3-a456-426614174000'
PS C:\> $AppId = '5e86312f-6d33-4734-9295-dc26b8478903'
PS C:\> $Token = Get-EWSOauthToken -TenantID $TenantId -AppID $AppId -AppSecret $env:AppSecret
```

Connects to Oauth2 login endpoint attempts to obtain an access token.
Uses an app secret from environment variable AppSecret.

## PARAMETERS

### -TenantId

TenantID for Microsoft Azure Entra ID tenant. Used to generate the URI to Oauth2 login endpoint.

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

### -AppId

Application Id from Entra ID application registration. Also known as Client Id.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AppSecret

Secret value associated with the Entra ID Enterprise Application registration.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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

### String

## NOTES

## RELATED LINKS

- [https://learn.microsoft.com/en-us/entra/identity-platform/v2-oauth2-auth-code-flow](https://learn.microsoft.com/en-us/entra/identity-platform/v2-oauth2-auth-code-flow)
