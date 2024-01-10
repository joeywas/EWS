Function Get-EWSOAuthToken {
    <#
    .SYNOPSIS
    Gets bearer access token

    .DESCRIPTION
    Uses Office 365 Application ID and Application Secret to generate an authentication token

    .PARAMETER TenantId
    M365 Tenant ID, normally a GUID

    .PARAMETER AppId
    Microsoft Azure Application ID also known as Client ID

    .PARAMETER AppSecret
    Microsoft Azure Application secret

    #>
    [CmdletBinding()]
    Param (
        [parameter(Mandatory = $true)]
        [string]$TenantId,

        [parameter(Mandatory = $true)]
        [string]$AppId,

        [parameter(Mandatory = $true)]
        [string]$AppSecret
    )
    begin {
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

        $Uri = "https://login.microsoftonline.com/$($TenantId)/oauth2/v2.0/token"

        $Body = @{
            grant_type = 'client_credentials'
            client_id = $AppId
            client_secret = $AppSecret
            scope = 'https://outlook.office365.com/.default'
        }
    }
    process {
        try {
            $OauthResponse = Invoke-RestMethod -Method Post -Uri $Uri -Body $Body
            $OauthResponse.access_token    
        } catch {
            Write-Error -Message "[Get-EWSOauthToken] Failed to get access_token - $_"
            return
        }
    }
}
